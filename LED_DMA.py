# programs to extract IceCube phase 1 + DeepCore data and prepare for WS2812b LED model
#
# step 1: extract data from I3 file for DeepCore and Phase1
#         output format: string OM time charge integer
#                        time:          integer in ns
#                        charge:        integer in units of 10 PE (to the closest integer)
# example:               86 1 300 12
#
# step 2: reorder data according to time slice (configurable)
#         start_time, end_time, time_step; from there, calculate n_slice=int(round((end_time-start_time)/time_step))
#         n_slice <= xx
#
# step 3: calculate, which OM's are on in given time slice
#
# step 4: reorder according to string and OM for each time slice
#
# step 5: reorder strings according to electronics#
# step 6: calculate bit pattern for a given time slice for all OMs
#
# step 7: call c program to put into memory
#
# define a sine wave rainbow color spectrum
# The max size of a lite DMA transfer is 65536 bytes = 524288 bits; each LED needs 9 bytes (3 colors, 8 bits, 3 values)
# 1 x 16 x 95 x 9 = 13680 bytes, 4 time slices fit, not more ... need to send time slices per slice to c code ...
# most available DMA channels are ‘lite’ 16 bit channels (see the BCM2835 ARM Peripherals document)
# that can only handle a maximum of 64K bytes per transfer, so you might need to use a non-lite channel (0 to 6)
# without disrupting those that are already (arbitrarily) taken by OS functions. These leaves one with channels 4,5
# that have 32 bit transfer. There is also a limit as to the amount of uncached memory that the GPU will give you.

import numpy as np
import LED_DMA_UTILITY as ldu
import ctypes
import json
import os
import glob
import numpy.ctypeslib as ctl
import argparse
import time 
#
# ================== set up ctypes call to c program =========================================
#
testlib=ctypes.CDLL('/home/pi/model/LED_DMA.so')          # shared library
py_test=testlib.LED_DMA                                   # c program name
# c program expects:
#    pointer  to 16 bit uint array
#    number of iterations of pattern (int)
#    number of time slices per pattern (int)
#    number of LEDs per string (int)
#    delay time between slices (all int)
py_test.argtypes = [ctl.ndpointer(np.uint16,flags='aligned,c_contiguous'),ctypes.c_int,ctypes.c_int,ctypes.c_int,ctypes.c_int]
# ============================================================================================

#
# ================== read parameters from console ===========================================
working_directory=os.getcwd()                       # get working directory (for default output)
#
parser = argparse.ArgumentParser(prog='LED_DMA',description='make patterns and send to c-program')
parser.add_argument('-i', '--input_filename', metavar='\b',
                    default='data/NuMu101GeV.json',
                    dest='input_filename',
                    help='input file(s); wildcards allowed (default: data/NuMu101GeV.json)')
parser.add_argument('-n', '--number_iterations',metavar='\b',
                    default=100,
                    dest='iterations',
                    type=int,
                    help='# of iterations of pattern (default: 100)')
parser.add_argument('-d', '--delay_iterations', metavar='\b',
                    default=100,
                    dest='delay',
                    type=int,
                    help='delay between iterations (default: 100 [ms])')
parser.add_argument('-p', '--pattern', metavar='\b',
                    default='allon',
                    dest='pattern',
                    help ='select pattern data,datatime, wipe (c), wipe3, rainbowwipe, rainbowtheater, singlewipe (c), rainbow, allon (c), showstring (s,c), showdom (s,D,c), instrument (default: allon)')
parser.add_argument('-c', '--color', metavar='\b',
                    default='0xff0000',
                    dest='color_string',
                    help ='select colour in hex format (default: 0xff0000 (red))')
parser.add_argument('-s', '--string', metavar='\b',
                    default=79,
                    dest='string_id',
                    type=int,
                    help ='select string number (79-93) (default: 79)')
parser.add_argument('-D', '--DOM', metavar='\b',
                    default=79,
                    dest='DOM_id',
                    type=int,
                    help ='select DOM  number (1-95) (default: 1)')
parser.add_argument('-b', '--brightness', metavar='\b',
                    default=0.5,
                    type=float,
                    dest='brightness',
                    help ='select brigthness (float value between 0 [off] and 1 [brightest] (default: 1.0)')
parser.add_argument('-t', '--type', metavar='\b',
                    default='WOM',
                    dest='type',
                    help ='instrument type: DEgg,mDOM,pDOM,WOM,AM,PB,SWE,POCAM,DMice (default: WOM)')

parsed, unknown = parser.parse_known_args()
# color is parsed as string; need to convert to integer
color=0
if parsed.pattern == 'wipe' or parsed.pattern == 'singlewipe' or parsed.pattern== 'allon' or parsed.pattern == 'showstring' or parsed.pattern == 'showdom':
    color=int(parsed.color_string.replace("0x", ""),16)
#
# ============================================================================================
#
# ================== loop over files when using simulated data ===============================
if parsed.pattern == 'data' or parsed.pattern == 'datatime':
   filepathnames = glob.glob(parsed.input_filename)
   print(parsed.input_filename,filepathnames)
#   filenames = [os.path.basename(i) for i in glob.glob(parsed.input_filename)] # without directory name
# ============================================================================================


# ==================  LED strip parameters ==================================================
colors      = 3     # red green blue
color_bits  = 8     # 8 bits for each colour
# ============================================================================================
#
# ==================  model parameters ======================================================
strings     = 16    # maximal number of strings (16 allowed)
LEDs        = 95    # maximal numbers of LED's per strip
# ============================================================================================
#
# ==================  initialize =============================================================
wipe=False;wipe3=False;singlewipe=False;rainbowwipe=False;rainbowtheater=False;rainbow=False
showstring=False;showdom=False;allon=False;instrument=False;data=False;datatime=False
slices=95           # default number of time slices
# ============================================================================================
#
# =================== settings according to pattern ==========================================
if     parsed.pattern == 'wipe':           wipe            = True
elif   parsed.pattern == 'wipe3':          wipe3           = True; slices=LEDs*colors
elif   parsed.pattern == 'rainbowwipe':    rainbowwipe     = True;
elif   parsed.pattern == 'rainbowtheater': rainbowtheater  = True;
elif   parsed.pattern == 'rainbow':        rainbow         = True; slices=1
elif   parsed.pattern == 'singlewipe':     singlewipe      = True; slices=LEDs*strings
elif   parsed.pattern == 'showstring':     showstring      = True; slices=1
elif   parsed.pattern == 'showdom':        showdom         = True; slices=1
elif   parsed.pattern == 'allon':          allon           = True; slices=1
elif   parsed.pattern == 'instrument':     instrument      = True; slices=1
elif   parsed.pattern == 'datatime':       datatime        = True; slices=360
elif   parsed.pattern == 'data':           data            = True; slices=1
else:                                      print("option not available")
# ===========================================================================================

# ================== set up array for c program depending on what to display ================
largearray = np.zeros((slices,LEDs,strings,colors), dtype=np.uint8)  # three 8 bit color
# ===========================================================================================
# print("largearray=",largearray)
# ================== call pattern producing programs ========================================
if wipe:             largearray=ldu.Wipe(largearray,color,parsed.brightness)
elif wipe3:          largearray=ldu.Wipe3(largearray,parsed.brightness)
elif rainbowwipe:    largearray=ldu.RainbowWipe(largearray,parsed.brightness)
elif rainbowtheater: largearray=ldu.RainbowTheater(largearray,parsed.brightness)
elif rainbow:        largearray=ldu.Rainbow(largearray,parsed.brightness)
elif singlewipe:     largearray=ldu.ColorSingleWipe(largearray,color,parsed.brightness)
elif instrument:     largearray=ldu.Instrument(largearray,parsed.type,parsed.brightness)
elif showstring:     largearray=ldu.ShowString(largearray,parsed.string_id,color,parsed.brightness)
elif showdom:        largearray=ldu.ShowDOM(largearray,parsed.DOM_id,parsed.DOM_id,color,parsed.brightness)
elif allon:          largearray=ldu.AllOn(largearray,color,parsed.brightness)
elif data or datatime:
    start= 10000    # simulation is given in window; select central part to suppress noise
    stop = 12000
    #time_index = ldu.time_slice_index(start,stop,testdata)
    #
    # --------   fill large array in predefined time bins with color code -------------------
    # physics region model shows DOMs 11-60 (DeepCore) and DOMs 32 to 125 (upgrade)
    # reorder, so we start with lowest DOM in each string
    #
    ldu.turn_HDMI_off()
    for i in range(len(filepathnames)):
      largearray = np.zeros((slices,LEDs,strings,colors), dtype=np.uint8)  # three 8 bit color
      f= open(filepathnames[i])
      print(filepathnames[i])
      tempfile = np.array(json.load(f))
      #print("input",tempfile)
      time_index = ldu.time_slice_index(start,stop,tempfile)
      #print("index",time_index)
      for k in range(len(tempfile)):
        string_id = tempfile[k,0]
        DOM_id    = tempfile[k,1]
        pulse_time= tempfile[k,2]
        if pulse_time < start or pulse_time > stop: continue        # important!
        elif string_id < 87 and DOM_id < 11:        continue        # DeepCore: take only physics region!
        elif string_id < 87 and DOM_id > 60:        continue        # DeepCore
        elif string_id > 86 and DOM_id < 33:        continue        # phase 1
        elif (string_id >  90 or string_id == 89)                    and DOM_id > 120:  continue
        elif (string_id == 87 or string_id == 88 or string_id == 90) and DOM_id > 125:  continue   # 87 88 90 are longer
        #print(time_index[k],string_id,DOM_id)
        #largearray[time_index[k],ldu.DOM_index(string_id,DOM_id),ldu.string_index(string_id)]=ldu.SineLED(time_index[k],parsed.brightness)
        if data:     largearray[0,ldu.DOM_index(string_id,DOM_id),ldu.string_index(string_id)]=ldu.SineLED(time_index[k],parsed.brightness)
        if datatime: largearray[time_index[k],ldu.DOM_index(string_id,DOM_id),ldu.string_index(string_id)]=ldu.SineLED(time_index[k],parsed.brightness)
        #print(time_index[k],ldu.DOM_index(string_id,DOM_id),ldu.string_index(string_id),ldu.SineLED(time_index[k],parsed.brightness))
      #print(largearray[0,:,:,:].tolist())
      #print(largearray[1,:,:,:].tolist())
      #print(largearray[2,:,:,:].tolist())
      to_c_code=ldu.fillarray(largearray,slices,LEDs,strings,color_bits)    # arange bits
      #print(to_c_code)
      py_test(to_c_code,parsed.iterations,slices,LEDs,parsed.delay)         # call c program
      f.close()
      time.sleep(1)
    ldu.turn_HDMI_on()
else: print("wrong keyword")

if not data and  not datatime:
   # =====================================================================================
   #print("allon=",allon,"data=",data,largearray)
   # =====================================================================================
   #print(largearray.tolist())
   ldu.turn_HDMI_off()
   #time.sleep(5)
   to_c_code=ldu.fillarray(largearray,slices,LEDs,strings,color_bits)    # arange bits
   #print(to_c_code.reshape(slices,LEDs,3,3*color_bits))
   #print(to_c_code)
   py_test(to_c_code,parsed.iterations,slices,LEDs,parsed.delay)         # call c program
   ldu.turn_HDMI_on()
   print("======================== DONE =========================")
# ========================================================================================
