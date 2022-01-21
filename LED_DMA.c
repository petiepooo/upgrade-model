// Raspberry Pi WS2812 LED driver using SMI
// For detailed description, see https://iosoft.blog
//
// Copyright (c) 2020 Jeremy P Bentham
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// v0.01 JPB 16/7/20 Adapted from rpi_smi_adc_test v0.06
// v0.02 JPB 15/9/20 Addded RGB to GRB conversion
// v0.03 JPB 15/9/20 Added red-green flashing
// v0.04 JPB 16/9/20 Added test mode
// v0.05 JPB 19/9/20 Changed test mode colours
// v0.06 JPB 20/9/20 Outlined command-line data input
// v0.07 JPB 25/9/20 Command-line data input if not in test mode
// v0.08 JPB 26/9/20 Changed from 4 to 3 pulses per LED bit
//                   Added 4-bit zero preamble
//                   Added raw Tx data test
// v0.09 JPB 27/9/20 Added 16-channel option
// v0.10 JPB 28/9/20 Corrected Pi Zero caching problem
// v0.11 JPB 29/9/20 Added enable_dma before transfer (in case still active)
//                   Corrected DMA nsamp value (was byte count)
// v0.12 JPB 26/5/21 Corrected transfer length for 16-bit mode
//
// modified by LHK 05/12/21 simplified to accept buffer prepared by python code
// may want to switch to DMA channel 4 or 5, because these are not lite and are twice as wide
#include <stdio.h>
#include <signal.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <ctype.h>
#include "rpi/rpi_dma_utils.h"
#include "rpi/rpi_smi_defs.h"

#if PHYS_REG_BASE==PI_4_REG_BASE        // Timings for RPi v4 (1.5 GHz)
#define SMI_TIMING       10, 15, 30, 15    // 400 ns cycle time
#else                                   // Timings for RPi v0-3 (1 GHz)
#define SMI_TIMING       10, 10, 20, 10   // 400 ns cycle time (original)
//#define SMI_TIMING       4, 26, 52, 26   // 416 ns cycle time
//#define SMI_TIMING       10, 12, 16, 12   // 400 ns cycle time
#endif

#define LED_D0_PIN      8   // GPIO pin for D0 output
#define LED_NCHANS      16  // Number of LED channels (8 or 16)
#define LED_NBITS       24  // Number of data bits per LED (3 colors with 8 bits each)
#define LED_PREBITS     4   // Number of zero bits before LED data (default 4)
#define LED_POSTBITS    4   // Number of zero bits after LED data
#define BIT_NPULSES     3   // Number of O/P pulses per LED bit
#define CHAN_MAXLEDS    96  // Maximum number of LEDs per channel
#define REQUEST_THRESH  2   // DMA request threshold
#define DMA_CHAN        10  // DMA channel to use (may want to change to  5, to get more than 65533 byte transfers)

// Length of data for 1 row (1 LED on each channel)
#define LED_DLEN        (LED_NBITS * BIT_NPULSES)

// Structures for mapped I/O devices, and non-volatile memory
extern MEM_MAP gpio_regs, dma_regs;
MEM_MAP vc_mem, clk_regs, smi_regs;

// Pointers to SMI registers
volatile SMI_CS_REG  *smi_cs;
volatile SMI_L_REG   *smi_l;
volatile SMI_A_REG   *smi_a;
volatile SMI_D_REG   *smi_d;
volatile SMI_DMC_REG *smi_dmc;
volatile SMI_DSR_REG *smi_dsr;
volatile SMI_DSW_REG *smi_dsw;
volatile SMI_DCS_REG *smi_dcs;
volatile SMI_DCA_REG *smi_dca;
volatile SMI_DCD_REG *smi_dcd;

// Ofset into Tx data buffer, given LED number in chan
#define LED_TX_OSET(n)      (LED_PREBITS + (LED_DLEN * (n)))

// Size of data buffers & NV memory, given number of LEDs per chan
#define TX_BUFF_LEN(n)      (LED_TX_OSET(n) + LED_POSTBITS)
#define TX_BUFF_SIZE(n)     (TX_BUFF_LEN(n) * sizeof(uint16_t))
#define VC_MEM_SIZE         (PAGE_SIZE + TX_BUFF_SIZE(CHAN_MAXLEDS))


uint16_t *txdata;                               // Pointer to uncached Tx data buffer
uint16_t tx_buffer[TX_BUFF_LEN(CHAN_MAXLEDS)];  // Tx buffer for assembling data

// void swap_bytes(void *data, int len);
void map_devices(void);
void fail(char *s);
void terminate(int sig);
void init_smi(int width, int ns, int setup, int hold, int strobe);
void setup_smi_dma(MEM_MAP *mp, int nsamp);
void start_smi(MEM_MAP *mp);

//----------------------------------------------------------------------------
int LED_DMA(uint16_t* array, int n_iterations, int n_slices, int n_LEDs, int wait_msec)
//----------------------------------------------------------------------------
{
    //for (int m=0;m<40;m++) {printf("array %i %i \n",m,array[m]);}
    printf("n_slices= %i\n",n_slices);
    printf("n_LEDs= %i\n",n_LEDs);
    printf("n_iterations= %i\n",n_iterations);
    printf("wait_msec= %i\n",wait_msec);
    printf("peripheral base address= %x\n",PHYS_REG_BASE);
    //printf("peripheral base address= %i\n",bcm_host_get_peripheral_address());
    signal(SIGINT, terminate);                  //<----- what is this for?

    map_devices();
    init_smi(SMI_16_BITS, SMI_TIMING);
    map_uncached_mem(&vc_mem, VC_MEM_SIZE);
    setup_smi_dma(&vc_mem, TX_BUFF_LEN(n_LEDs));

	// get data
	for (int i=0; i < n_iterations;i++)
	{        //printf("in iterations loop %i\n",i);
                 //init_smi(SMI_16_BITS, SMI_TIMING);
                 //map_uncached_mem(&vc_mem, VC_MEM_SIZE);
                 //setup_smi_dma(&vc_mem, TX_BUFF_LEN(n_LEDs));

		for (int j=0; j<n_slices;j++)
		{       //printf("in slices loop\n");
			memcpy(&tx_buffer[LED_PREBITS],(array + j*LED_DLEN*n_LEDs),LED_DLEN*n_LEDs*sizeof(uint16_t));//<-- wrong ?
                        //printf("j*LED_DLEN %i LED_DLEN*n_LEDs %i  sizeof(uint16_t) %i \n",j*LED_DLEN,LED_DLEN*n_LEDs,sizeof(uint16_t));
				// rgb_txdata(rgb_data[n], &tx_buffer[LED_TX_OSET(n)]);   //<----- change
			memcpy(txdata, tx_buffer, TX_BUFF_SIZE(n_LEDs));   // from intermediate buffer into uncached DMA memory
	                //for (int m=0;m<76;m++) {printf("txdata %i %i \n",m,txdata[m]);}
                        //if ( dma_active(DMA_CHAN)) printf("DMA active in loop\n");
	        	enable_dma(DMA_CHAN);
			start_smi(&vc_mem);
                        //disp_dma(16);
			//usleep(300);                                       // 10 mus
                        int m =0; 
			while (dma_active(DMA_CHAN)) { m+=1;usleep(100);}   // 10 mus
			//printf("%i times DMA active after start_smi\n",m); // 10 mus
			usleep(wait_msec * 1000);
		}
	}
    terminate(0);
    return(0);
}   // end main


//----------------------------------------------------------------------------
// Map GPIO, DMA and SMI registers into virtual mem (user space)
// If any of these fail, program will be terminated
void map_devices(void)
//----------------------------------------------------------------------------
{
    map_periph(&gpio_regs, (void *)GPIO_BASE, PAGE_SIZE);
    map_periph(&dma_regs,  (void *)DMA_BASE,  PAGE_SIZE);
    map_periph(&clk_regs,  (void *)CLK_BASE,  PAGE_SIZE);
    map_periph(&smi_regs,  (void *)SMI_BASE,  PAGE_SIZE);
}

// Catastrophic failure in initial setup
void fail(char *s)
{
    printf(s);
    terminate(0);
}
//----------------------------------------------------------------------------
// Free memory segments and exit
void terminate(int sig)
//----------------------------------------------------------------------------
{
    int i;

    printf("Closing\n");
    if (gpio_regs.virt)
    {
        for (i=0; i<LED_NCHANS; i++)
            gpio_mode(LED_D0_PIN+i, GPIO_IN);
    }
    if (smi_regs.virt)
        *REG32(smi_regs, SMI_CS) = 0;
    stop_dma(DMA_CHAN);
    unmap_periph_mem(&vc_mem);
    unmap_periph_mem(&smi_regs);
    unmap_periph_mem(&dma_regs);
    unmap_periph_mem(&gpio_regs);
    //exit(0);
    return;
}
//----------------------------------------------------------------------------
// Initialise SMI, given data width, time step, and setup/hold/strobe counts
// Step value is in nanoseconds: even numbers, 2 to 30
void init_smi(int width, int ns, int setup, int strobe, int hold)
//----------------------------------------------------------------------------
{
    int i, divi = ns / 2;

    smi_cs  = (SMI_CS_REG *) REG32(smi_regs, SMI_CS);
    smi_l   = (SMI_L_REG *)  REG32(smi_regs, SMI_L);
    smi_a   = (SMI_A_REG *)  REG32(smi_regs, SMI_A);
    smi_d   = (SMI_D_REG *)  REG32(smi_regs, SMI_D);
    smi_dmc = (SMI_DMC_REG *)REG32(smi_regs, SMI_DMC);
    smi_dsr = (SMI_DSR_REG *)REG32(smi_regs, SMI_DSR0);
    smi_dsw = (SMI_DSW_REG *)REG32(smi_regs, SMI_DSW0);
    smi_dcs = (SMI_DCS_REG *)REG32(smi_regs, SMI_DCS);
    smi_dca = (SMI_DCA_REG *)REG32(smi_regs, SMI_DCA);
    smi_dcd = (SMI_DCD_REG *)REG32(smi_regs, SMI_DCD);
    smi_cs->value = smi_l->value = smi_a->value = 0;
    smi_dsr->value = smi_dsw->value = smi_dcs->value = smi_dca->value = 0;
    if (*REG32(clk_regs, CLK_SMI_DIV) != divi << 12)
    {
        *REG32(clk_regs, CLK_SMI_CTL) = CLK_PASSWD | (1 << 5);
        usleep(10);
        while (*REG32(clk_regs, CLK_SMI_CTL) & (1 << 7)) ;
        usleep(10);
        *REG32(clk_regs, CLK_SMI_DIV) = CLK_PASSWD | (divi << 12);
        usleep(10);
        *REG32(clk_regs, CLK_SMI_CTL) = CLK_PASSWD | 6 | (1 << 4);
        usleep(10);
        while ((*REG32(clk_regs, CLK_SMI_CTL) & (1 << 7)) == 0) ;
        usleep(100);
    }
    if (smi_cs->seterr)
        smi_cs->seterr = 1;
    smi_dsr->rsetup    = smi_dsw->wsetup = setup;
    smi_dsr->rstrobe   = smi_dsw->wstrobe = strobe;
    smi_dsr->rhold     = smi_dsw->whold = hold;
    smi_dmc->panicr    = smi_dmc->panicw = 8;
    smi_dmc->reqr      = smi_dmc->reqw = REQUEST_THRESH;
    smi_dsr->rwidth    = smi_dsw->wwidth = width;

    for (i=0; i<LED_NCHANS; i++) gpio_mode(LED_D0_PIN+i, GPIO_ALT1);
}
//----------------------------------------------------------------------------
// Set up SMI transfers using DMA
void setup_smi_dma(MEM_MAP *mp, int nsamp)
//----------------------------------------------------------------------------
{
    DMA_CB *cbs=mp->virt;

    txdata = (uint16_t *)(cbs+1);
    smi_dmc->dmaen = 1;
    smi_cs->enable = 1;
    smi_cs->clear  = 1;
    smi_cs->pxldat = 1;
    smi_l->len = nsamp * sizeof(uint16_t);
    smi_cs->write  = 1;
    enable_dma(DMA_CHAN);
    cbs[0].ti = DMA_DEST_DREQ | (DMA_SMI_DREQ << 16) | DMA_CB_SRCE_INC | DMA_WAIT_RESP;
    cbs[0].tfr_len = nsamp * sizeof(uint16_t);
    cbs[0].srce_ad = MEM_BUS_ADDR(mp, txdata);
    cbs[0].dest_ad = REG_BUS_ADDR(smi_regs, SMI_D);
}
//----------------------------------------------------------------------------
// Start SMI DMA transfers
void start_smi(MEM_MAP *mp)
//----------------------------------------------------------------------------
{
    DMA_CB *cbs=mp->virt;

    start_dma(mp, DMA_CHAN, &cbs[0], 0);
    smi_cs->start = 1;
}
// EOF
