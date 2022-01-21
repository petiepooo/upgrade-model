import numpy as np
import subprocess
lights=[ 0, 0, 0, 0, 0, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 15, 17, 18, 20,
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

def fillarray(A,slices=0,LEDs=96,strings=16,color_bits=8):
    # routine to fill bit filled vector H
    #
    # input:
    #
    # A index 0: timeslice
    # A index 1: DOM
    # A index 2: string
    # A value:   BGR (blue green red)
    #
    # output:
    #
    # H array:
    #            Ch15Ch14Ch13Ch12Ch11Ch10 Ch9 Ch8 Ch7 Ch6 Ch5 Ch4 Ch3 Ch2 Ch1 Ch0
    #               1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
    # Green bit 7:  x   x   x   x   x   x   x   x   x   x   x   x   x   x   x   x
    #               0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
    #               1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
    # Green bit 6:  x   x   x   x   x   x   x   x   x   x   x   x   x   x   x   x
    #               0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
    # ... and so on until ...
    #               1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
    # Green bit 0:  x   x   x   x   x   x   x   x   x   x   x   x   x   x   x   x
    #               0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
    #               1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
    # Red bit 7:    x   x   x   x   x   x   x   x   x   x   x   x   x   x   x   x
    #               0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
    # ... and so on until ...
    #               1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
    # Blue bit 0:   x   x   x   x   x   x   x   x   x   x   x   x   x   x   x   x
    #               0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
    # .. next LED
    #
    # pointer to buffer for LED n: LED_TX_OSET(n) = LED_PREBITS + LED_DLEN * n
    # buffer length:               TX_BUFF_LEN(n) = LED_TX_OSET(n) + LED_POSTBITS
    #
    # To set one device, send green bits G7 to G0, red bits R7 to R0, and blue bits B7 to B0, in that order
    # Sending more than 24 bits, the extra bits from the data output pin drive the data input of the next LED.
    # To drive n LEDs, one needs to send n * 24 pulses, with 4 pre and 4 post bits at the beginning and at the end.
    # If there is a sizeable gap for the reset time or longer, the next transmission will restart at the first LED.
    #
    # The handling of the pre- and postbits is done in the c code by the definition of the buffer pointers.
    # The switch to the next time slice is handled by a sleep command in the c code.
    #
    #print("slices=",slices,"LEDs=",LEDs,"strings=",strings,"color_bits=",color_bits)
    #
    # example color = 0x110000
    # temp_red= [[[[0 0 0 0 0 0 1 1]    8 color bits for 16 strings
    #              [0 0 0 0 0 0 1 1]
    #              [0 0 0 0 0 0 1 1]
    #  ...
    #              [0 0 0 0 0 0 1 1]
    #              [0 0 0 0 0 0 1 1]
    #              [0 0 0 ... 0 1 1]]
    # repeats for each LED
    # repeats for each slice
    #
    temp_red   = np.unpackbits(A[:,:,:,0]).reshape(slices,LEDs,strings,color_bits)   # reshape, color bit 7 first
    temp_green = np.unpackbits(A[:,:,:,1]).reshape(slices,LEDs,strings,color_bits)   # reshape, color bit 7 first
    temp_blue  = np.unpackbits(A[:,:,:,2]).reshape(slices,LEDs,strings,color_bits)   # reshape, color bit 7 first
    #print("original blue=",A[:,:,:,2])
    #print("bits=",temp_blue)
    #
    # Ered= [[    0     0     0     0     0     0 65535 65535]      #  LEDs x   8 color bits 16 bit word (1 bit per string)
    #        [    0     0     0     0     0     0 65535 65535]
    #        .....
    #        [    0     0     0     0     0     0 65535 65535]]
    #
    Tgreen = np.ndarray.transpose(temp_green,(0,1,3,2)).reshape(slices,LEDs,color_bits,2,8)[:,:,:,:,::-1]    # packing works only with 8 bits
    Tred   = np.ndarray.transpose(temp_red,  (0,1,3,2)).reshape(slices,LEDs,color_bits,2,8)[:,:,:,:,::-1]    # reorder so that string 0 is lowest bit
    Tblue  = np.ndarray.transpose(temp_blue, (0,1,3,2)).reshape(slices,LEDs,color_bits,2,8)[:,:,:,:,::-1]
    Egreen = np.packbits(Tgreen).view(np.uint16).reshape(slices,LEDs,color_bits) # rearange green bins by string
    Ered   = np.packbits(Tred).view(np.uint16).reshape(slices,LEDs,color_bits) # rearange red bins by string
    Eblue  = np.packbits(Tblue).view(np.uint16).reshape(slices,LEDs,color_bits) # rearange blue bins by string
    # now, for each LED, put green first, then red, then blue
    # print("transposed=",Tblue)
    # print("Eblue=",Eblue)

    Ecolor=np.block([Egreen,Ered,Eblue]).flatten()
    # now interweave 65535  (16 bits set) and 0 with each color bit
    in_ones   = range(0,len(Ecolor),1)                             # position to fill ones before color bitpattern
    temp      = np.insert(Ecolor,in_ones,65535)                    # fill in ones for # of strings
    in_zeros  = range(2,len(temp)+1,2)                             # position to fill zeros after color bitpattern
    full      = np.insert(temp,in_zeros,0)                         # fill in zeros for # of strings
    return full

def index_flat(rows,columns,indexlist):
    ind_matrix = np.arange(0, rows*columns).reshape(rows, columns)
    temp_index=indexlist.T.tolist()
    return ind_matrix[tuple(temp_index)]   # produce flat index array

def Split24(input,brightness):
    temp,blue = divmod(input,256)
    red,green = divmod(temp, 256)
    #print("input=",input)
    #print(red,green,blue)
    return (int(round(red*brightness,0)),int(round(green*brightness,0)),int(round(blue*brightness,0)))   # splits 24 bit rgb color into three single 8 bit colors red, green, blue

def SineLED(angle,brightness):
    return (int(round(lights[(angle+120)%360]*brightness,0)),int(round(lights[angle]*brightness,0)), int(round(lights[(angle+240)%360]*brightness,0))) # return color triple

def time_slice_index(start,stop,data_array):
    duration=(stop-start)
    index = np.rint(359*(data_array[:,2]-start)/(stop-start)).astype(int)
    #return index[(data_array[:,2] > start) & (data_array[:,2] < stop)] 
    return index #result only makes sense for times between start and stop; however, we cut later on this ... 

def string_index(string_id):
    # routine to calculate index in largearray for a given string number
    # start with DeepCore string as index 0
    # also use this routine to correct for cabeling and assignment to Raspberry Pi pins
    # assign_string=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14] # here define electronics mess
    assign_string=[12,13,5,14,4,11,10,2,9,6,1,8,0,3,7] # here define electronics mess
    return assign_string[string_id-79]   # start with index 0 and assign to correct rpi channel

def DOM_index(string_id,DOM_id):
    if   string_id < 87: return 59  - (DOM_id-11)    # 0 to 59 starting with lowest DOM 60 to DOM 11
    elif string_id > 86: return 95  - (DOM_id-32)    # 0 to 95 starting with lowest DOM 96 to DOM 32

def turn_HDMI_on():
    subprocess.call("sh ./monitor_on.sh",shell=True)

def turn_HDMI_off():
    subprocess.call("sh ./monitor_off.sh",shell=True)

def Wipe3(arr,brightness):
    # dimension of arr: slices x LEDs x strings = 96*3x96x16x3 !
    # turns on 1 LED more with one of three basic color for increasing timeslices (same for all strings)
    col=[0xff0000,0x00ff00,0x0000ff]
    temp=np.zeros((arr.shape[1],arr.shape[2],arr.shape[3]), dtype=np.uint8)
    for i in range(3):
        for k in range(arr.shape[1]):
            temp[k,:,:]=Split24(col[i])
            arr[k+i*arr.shape[1]]=temp
    return arr

def Wipe(arr,color,brightness):
    # dimension of arr: slices x LEDs x strings = 96x96x16x3 !
    # turns on 1 LED more with chosen color for increasing timeslices (same for all strings)
    temp=np.zeros((arr.shape[1],arr.shape[2],arr.shape[3]), dtype=np.uint8)
    for k in range(arr.shape[1]):  # LEDs
        temp[k,:,:] = Split24(color,brightness)
        arr[k]      = temp
    return arr

def ColorSingleWipe(arr,color,brightness):
    # dimension of arr: slices x LEDs x strings =  (96*16)x96x16x3 !
    # turns on 1 LED more with chosen color for increasing timeslices (string after string)
    temp=np.zeros((arr.shape[1],arr.shape[2],arr.shape[3]),dtype=np.uint8)
    for j in range(arr.shape[2]):         # strings
        for k in range(arr.shape[1]):     # LEDs
            temp[k,j,:]=Split24(color,brightness)
            arr[k+j*arr.shape[1]]=temp
    return arr

def RainbowWipe(arr,brightness):
    # dimension of arr: slices x LEDs x strings = 96x96x16x3 !
    # similar as colorwipe, but changing colors (same for all strings)
    temp=np.zeros((arr.shape[1],arr.shape[2],arr.shape[3]),dtype=np.uint8)
    for k in range(arr.shape[1]):
         temp[k,:,:]=SineLED(int(k*360/arr.shape[1]),brightness)
         arr[k]=temp
    return arr

def Rainbow(arr,brightness):
    # dimension of arr: slices x LEDs x strings = 1x96x16x3 !
    # similar as allon, but changing colors (same for all strings)
    for k in range(arr.shape[1]):
         arr[:,k,:,:]=SineLED(int(k*360/arr.shape[1]),brightness)
    return arr

def ShowString(arr,string_id,color,brightness):
    # dimension of arr: slices x LEDs x strings = 1x96x16x3 !
    # sets all LEDs in particular string_id to color
    #print(arr.shape)
    arr[:,:,string_index(string_id),:]=Split24(color,brightness)
    return arr

def AllOn(arr,color,brightness):
    # dimension of arr: slices x LEDs x strings = 1x96x16x3 !
    # sets all strings to color
    arr[:,:,:,:]=Split24(color,brightness)
    return arr

def Instrument(arr,type,brightness):
    if    type == 'pDOM' :
        color=0xff0000   # red                (pDOM)
        ind=[[string_index(87),DOM_index(87,95)],
             [string_index(88),DOM_index(88,83)],
             [string_index(89),DOM_index(89,77)],
             [string_index(90),DOM_index(90,107)],
             [string_index(91),DOM_index(91,59)],
             [string_index(92),DOM_index(92,35)],
             [string_index(93),DOM_index(93,71)]]
    elif  type == 'mDOM' : color=0x00ff00   # green              (mDOM)
    elif  type == 'DEgg' : color=0x0000ff   # blue               (DEgg)
    elif  type == 'WOM'  :
        color=0xffff00    # yellow             (WOM)
        ind=[[string_index(87),DOM_index(87,122)],
             [string_index(87),DOM_index(87,123)],
             [string_index(87),DOM_index(87,124)],
             [string_index(87),DOM_index(87,125)],
             [string_index(88),DOM_index(88,122)],
             [string_index(88),DOM_index(88,123)],
             [string_index(88),DOM_index(88,124)],
             [string_index(88),DOM_index(88,125)],
             [string_index(90),DOM_index(90,122)],
             [string_index(90),DOM_index(90,123)],
             [string_index(90),DOM_index(90,124)],
             [string_index(90),DOM_index(90,125)]]
    elif  type == 'DMice':
        color=0xff00ff   # magenta            (DM Ice)
        ind=[[string_index(88),DOM_index(88,126)],
             [string_index(90),DOM_index(90,126)]]
    elif  type == 'POCAM':
        color=0xfbceb1   # apricot            (POCAM)
        ind=[[string_index(87),DOM_index(87,101)],
             [string_index(88),DOM_index(88,89)],
             [string_index(89),DOM_index(89,53)],
             [string_index(90),DOM_index(90,113)],
             [string_index(91),DOM_index(91,65)],
             [string_index(92),DOM_index(92,41)],
             [string_index(93),DOM_index(93,77)]]
    elif  type == 'SWE'  :
        color=0xff1493   # deep pink          (Swedish camera)
        ind=[[string_index(87),DOM_index(87,93)],
             [string_index(88),DOM_index(88,103)],
             [string_index(90),DOM_index(90,114)],
             [string_index(92),DOM_index(92,95)],
             [string_index(93),DOM_index(93,71)]]
    elif  type == 'AM'   :
        color=0x8f00ff   # violet             (pencil beam)
        ind=[[string_index(87),DOM_index(87,98)],
             [string_index(88),DOM_index(88,89)],
             [string_index(89),DOM_index(89,50)],
             [string_index(90),DOM_index(90,110)],
             [string_index(91),DOM_index(91,62)],
             [string_index(92),DOM_index(92,38)],
             [string_index(93),DOM_index(93,47)]]
    elif  type == 'PB'   :
        color=0xffffff   # white              (acoustic module)
        ind=[[string_index(87),DOM_index(87,83)],
             [string_index(88),DOM_index(88,71)],
             [string_index(89),DOM_index(89,35)],
             [string_index(90),DOM_index(90,95)],
             [string_index(91),DOM_index(91,47)],
             [string_index(92),DOM_index(92,119)],
             [string_index(93),DOM_index(93,59)]]
    else: print("type",type,"unknown")

    # DEgg:  strings 87-93: DOMs 33,36,39,42,45,48,51,54, 57,60,63,66,69,72,75,78,81,84,87,
    #                            90,95,96,99,102,105,108,111,117,120
    # incomplete: 35,47,59,71,83,93,107,114,119
    # ndarray.flatten, np.put(), ndarray.reshape
    #length=arr.shape[2]
    #for k in range(ind):
        #arr[0,ind[0],ind[1]]=color
    #temp = ndarray.flatten
    # return arr
    #replace_index(arr,ind,Split24(color))
    np.put(arr,index_flat(arr.shape[0],arr.shape[1],ind),color)  # check!!
    return arr
