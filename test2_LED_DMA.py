# programs to extract IceCube phase 1 + DeepCore data and prepare for WS2812b LED model 
#
# step 1: extract data from I3 file, combine PMTs per DOM
#         output format: string OM time total_charge PMts_hit
#                        time:         w.r.t to trigger in ns 
#                        total charge: in units of PE (to the closest integer)
# example:               86 1 300 30 2 
# 
# step 2: reorder data according to time slice (configurable)
#         start_time, end_time, time_step; from there, calculate n_slice=int(rount((end_time-start_time)/time_step))
#         n_slice <= 16 or whatever number of colors we define 
#
# step 3: calculate, which OM's are on in given time slice
#
# step 4: reorder according to string and OM for each time slice
#
# step 5: reorder strings according to electronics 
#
# step 6: calculate bit pattern for a given time slice for all OMs
# 
# step 7: call c program to put into memory
#
# define a sine wave rainbow color spectrum

import numpy as np
import ctypes
import numpy as np
import numpy.ctypeslib as ctl


lights=[  0,   0,   0,   0,   0,   1,   1,   2,   2,   3,   4,   5,   6,   7,   8,   9,  11,  12,  13,  15,  17,  18,  20,  
         22,  24,  26,  28,  30,  32,  35,  37,  39,  42,  44,  47,  49,  52,  55,  58,  60,  63,  66,  69,  72,  75,  78,
         81,  85,  88,  91,  94,  97, 101, 104, 107, 111, 114, 117, 121, 124, 127, 131, 134, 137, 141, 144, 147, 150, 154, 
        157, 160, 163, 167, 170, 173, 176, 179, 182, 185, 188, 191, 194, 197, 200, 202, 205, 208, 210, 213, 215, 217,
        220, 222, 224, 226, 229, 231, 232, 234, 236, 238, 239, 241, 242, 244, 245, 246, 248, 249, 250, 251, 251, 252,
        253, 253, 254, 254, 255, 255, 255, 255, 255, 255, 255, 254, 254, 253, 253, 252, 251, 251, 250, 249, 248, 246,
        245, 244, 242, 241, 239, 238, 236, 234, 232, 231, 229, 226, 224, 222, 220, 217, 215, 213, 210, 208, 205, 202,
        200, 197, 194, 191, 188, 185, 182, 179, 176, 173, 170, 167, 163, 160, 157, 154, 150, 147, 144, 141, 137, 134,
        131, 127, 124, 121, 117, 114, 111, 107, 104, 101,  97,  94,  91,  88,  85,  81,  78,  75,  72,  69,  66,  63,
         60,  58,  55,  52,  49,  47,  44,  42,  39,  37,  35,  32,  30,  28,  26,  24,  22,  20,  18,  17,  15,  13,  
         12,  11,   9,   8,   7,   6,   5,   4,   3,   2,   2,   1,   1,   0,   0,   0,   0,   0,   0,   0,   0,   0,   
          0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
          0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
          0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
          0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
          0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 
          0,   0,   0,   0,   0]


def hex2bin(s):
    hex_table = ['0000', '0001', '0010', '0011',
                 '0100', '0101', '0110', '0111',
                 '1000', '1001', '1010', '1011',
                 '1100', '1101', '1110', '1111']
    bits = ''
    for i in range(len(s)):
        bits += hex_table[int(s[i], base=16)]
    return bits

def sineLED(angle):
    return np.array([lights[(angle+120)%360],lights[angle], lights[(angle+240)%360]])

def rgb2hex(r,g,b):
    return "{:02x}{:02x}{:02x}".format(r,g,b)

def sineLEDhex(angle):
    return rgb2hex(lights[(angle+120)%360],lights[angle], lights[(angle+240)%360])

def array_to_string(arr):
     return ','.join(['%s' % num for num in arr])

def time_slice_index(start,stop,testdata):
    duration=(stop-start)
    index = np.rint(359*(testdata[:,2]-start)/(stop-start)).astype(int)
    return index

def colorWipe(arr,color):
    # dimension of arr: 84x16*84 !
    for k in range(arr.shape[2]):
        arr[k,:,k]=color
def colorTest(arr):
    # dimension of arr: 84x16*84 !
    for k in range(arr.shape[2]):
        arr[:,:,:]=(0xFF,0xFF,0xFF)
        
def colorsingleWipe(arr,color):
    # dimension of arr: (84*16)x16x84 !
    for j in range(arr.shape[1]):
        for k in range(arr.shape[2]):
            arr[k+j*arr.shape[2],j,k]=color
    
def rainbowWipe(arr):
    # dimension of arr: 84x16*84 !
    for k in range(arr.shape[0]):
        arr[k,:,k]=sineLEDhex(int(k*360/arr.shape[0]))

def fillarray(A):
    # routine to fill bit filled vector
    # index 0: timeslice
    # index 1: string
    # index 2: DOM
    # value:   BGR(blau grün rot)
    #              Ch7 Ch6 Ch5 Ch4 Ch3 Ch2 Ch1 Ch0
    #               1   1   1   1   1   1   1   1
    # Green bit 7:  x   x   x   x   x   x   x   x
    #               0   0   0   0   0   0   0   0
    #               1   1   1   1   1   1   1   1
    # Green bit 6:  x   x   x   x   x   x   x   x
    #               0   0   0   0   0   0   0   0
    # ... and so on until ...
    #               1   1   1   1   1   1   1   1
    # Green bit 0:  x   x   x   x   x   x   x   x
    #               0   0   0   0   0   0   0   0
    #               1   1   1   1   1   1   1   1
    # Red bit 7:    x   x   x   x   x   x   x   x
    #               0   0   0   0   0   0   0   0
    # ... and so on until ...
    #               1   1   1   1   1   1   1   1
    # Blue bit 0:   x   x   x   x   x   x   x   x
    #               0   0   0   0   0   0   0   0
    # .. next LED
    #
    # pointer to buffer for LED n: LED_TX_OSET(n) = LED_PREBITS + LED_DLEN * n
    # buffer length:               TX_BUFF_LEN(n) = LED_TX_OSET(n) + LED_POSTBITS
    #
    # To set one device, send green bits G7 to G0, red bits R7 to R0, and blue bits B7 to B0, in that order
    # If one sends more than 24 bits, the extra bits  from the data output pin, drive the data input of the next LED 
    # to drive n LEDs, it is necessary to send n * 24 pulses, with4 pre and 4 post bits at the beginning and at the end 
    # if there is a sizeable gap for the reset time or longer,  the next transmission will restart at the first LED.
    # 
    # The handling of the gpre and postbits is done in the c code by the definition of the buffer pointers
    # The switch to the next time slice is handled by a sleep command in the c code
    #
    temp_green = np.unpackbits(A[:,:,:,0],bitorder='little').reshape(slices,LEDs,strings,bits)  # starts with highest bin
    temp_red   = np.unpackbits(A[:,:,:,1],bitorder='little').reshape(slices,LEDs,strings,bits)  # starts with highest bin
    temp_blue  = np.unpackbits(A[:,:,:,2],bitorder='little').reshape(slices,LEDs,strings,bits)  # starts with highest bin
    #print(temp_green)
    #print(temp_red)
    #print(temp_blue)
    Egreen = np.packbits(np.ndarray.transpose(temp_green,(0,1,3,2)))       # need to rearange bin by bin
    Ered   = np.packbits(np.ndarray.transpose(temp_red,(0,1,3,2)))         # need to rearange bin by bin
    Eblue  = np.packbits(np.ndarray.transpose(temp_blue,(0,1,3,2)))         # need to rearange bin by bin
    F      =np.concatenate((Egreen,Ered,Eblue), axis=None)
    #print(F)
    in_255= range(0,len(F)+1,1)
    G=np.insert(F,in_255,255)
    in_0  = range(2,len(G)+1,2)
    H=np.insert(G,in_0,0)
    return H

colors=3
bits=8
wipe=False;singlewipe=False;rainbow=False;data=False;test=True
if wipe or rainbow or test: slices=60;strings=8;LEDs=60
#if wipe or rainbow: slices=84;strings=16;LEDs=84
elif singlewipe:    slices=84*16;strings=16;LEDs=84
elif data:          slices=360;strings=16;LEDs=84
else:               print("option not available")

largearray=np.zeros((slices,strings,LEDs,colors),dtype =np.uint8)  # need zero first define as integers, others 0's become blanks

#largearray = temp.astype(str)      # now you have a string
if wipe:         colorWipe(largearray)
elif test:       colorTest(largearray)
elif rainbow:    rainbowWipe(largearray)
elif singlewipe: colorsingleWipe(largearray,'ff0000')
elif data:
    start = np.amin(testdata, axis=0)[2]
    stop  = np.amax(testdata, axis=0)[2]
    index = time_slice_index(start,stop,testdata)
    # fill large array for easy access time, string and LED ordered               
    for k in range(len(testdata)):
        largearray[index[k],testdata[k,0]-86,testdata[k,1]-1]=sineLEDhex(index[k])

'''
for i in range(largearray.shape[0]):            # loop over time slices
    arguments=""
    for k in range(largearray.shape[1]):
        arguments += array_to_string(largearray[2,k,:])
        arguments += " " 
print(arguments)
 '''
# give command for one time slice    
#for  k in range(100):
testlib=ctypes.CDLL('/home/pi/model/test.so')
py_test=testlib.test2_LED_DMA
py_test.argtypes = [ctl.ndpointer(np.uint8,flags='aligned,c_contiguous'),ctypes.c_int,ctypes.c_int,ctypes.c_int,ctypes.c_int]
py_test(fillarray(largearray),1,60,1,100)
