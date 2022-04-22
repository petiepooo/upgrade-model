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

def fillarray(A,slices=0,LEDs=95,strings=16,color_bits=8):
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
    # rows:    strings
    # columns: LEDs
    ind_matrix = np.arange(0, rows*columns).reshape(columns,rows)
    temp_list=np.ndarray.transpose(indexlist,(1,0))[::-1,:].tolist() # reorder LED,string
    #print("templist",temp_list)
    return ind_matrix[tuple(temp_list)]                              # produce flat index array

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
    #assign_string=[12,13,5,14,4,11,10,2,9,6,1,8,0,3,7] # here define electronics mess
    assign_string=[7,0,13,14,1,4,11,12,10,5,8,6,2,3,9] # problem 81/86
    return assign_string[string_id-79]   # start with index 0 and assign to correct rpi channel

def DOM_index(string_id,DOM_id):
    if   string_id < 87:
       idmax=49;idmin=11            # 0 to 49 starting with lowest DOM 60 to DOM 11
    elif string_id == 87 or string_id == 88 or string_id == 90:
       idmax=94;idmin=32            # 0 to 94 starting with lowest DOM 95 to DOM 32
    else:
       idmax=89;idmin=32            # 0 to 94 starting with lowest DOM 90 to DOM 32
    return idmax  - (DOM_id-idmin)  #  id start with 0 (lowest LED) going up 

def turn_HDMI_on():
    subprocess.call("sh ./monitor_on.sh",shell=True)

def turn_HDMI_off():
    subprocess.call("sh ./monitor_off.sh",shell=True)

def Wipe3(arr,brightness):
    # dimension of arr: slices x LEDs x strings = 95*3x95x16x3 !
    # turns on 1 LED more with one of three basic color for increasing timeslices (same for all strings)
    col=[0xff0000,0x00ff00,0x0000ff]
    temp=np.zeros((arr.shape[1],arr.shape[2],arr.shape[3]), dtype=np.uint8)
    for i in range(3):
        for k in range(arr.shape[1]):
            temp[k,:,:]=Split24(col[i],brightness)
            arr[k+i*arr.shape[1]]=temp
    return arr

def Wipe(arr,color,brightness):
    # dimension of arr: slices x LEDs x strings = 95x95x16x3 !
    # turns on 1 LED more with chosen color for increasing timeslices (same for all strings)
    temp=np.zeros((arr.shape[1],arr.shape[2],arr.shape[3]), dtype=np.uint8)
    for k in range(arr.shape[1]):  # LEDs
        temp[k,:,:] = Split24(color,brightness)
        arr[k]      = temp
    return arr

def ColorSingleWipe(arr,color,brightness):
    # dimension of arr: slices x LEDs x strings =  (95*16)x95x16x3 !
    # turns on 1 LED more with chosen color for increasing timeslices (string after string)
    temp=np.zeros((arr.shape[1],arr.shape[2],arr.shape[3]),dtype=np.uint8)
    for j in range(arr.shape[2]):         # strings
        for k in range(arr.shape[1]):     # LEDs
            temp[k,j,:]=Split24(color,brightness)
            arr[k+j*arr.shape[1]]=temp
    return arr

def RainbowWipe(arr,brightness):
    # dimension of arr: slices x LEDs x strings = 95x95x16x3 !
    # similar as colorwipe, but changing colors (same for all strings)
    temp=np.zeros((arr.shape[1],arr.shape[2],arr.shape[3]),dtype=np.uint8)
    for k in range(arr.shape[1]):
         temp[k,:,:]=SineLED(int(k*360/arr.shape[1]),brightness)
         arr[k]=temp
    return arr

def Rainbow(arr,brightness):
    # dimension of arr: slices x LEDs x strings = 1x95x16x3 !
    # similar as allon, but changing colors (same for all strings)
    for k in range(arr.shape[1]):
         arr[:,k,:,:]=SineLED(int(k*360/arr.shape[1]),brightness)
    return arr

def RainbowTheater(arr,brightness):
    # dimension of arr: slices x LEDs x strings = 95x95x16x3 !
    # similar to RainbowWipe, but  all colours moving
    temp=np.zeros((arr.shape[1],arr.shape[2],arr.shape[3]),dtype=np.uint8)
    for k in range(arr.shape[1]):
         temp[k,:,:]=SineLED(int(k*360/arr.shape[1]),brightness)
    for i in range(arr.shape[0]):
         arr[i,:,:,:] = np.roll(temp,i,axis=0)  # for each slice move all colours by 1 (circular buffer)
    return arr

def ShowString(arr,string_id,color,brightness):
    # dimension of arr: slices x LEDs x strings = 1x95x16x3 !
    # sets all LEDs in particular string_id to color
    #print(arr.shape)
    arr[:,:,string_index(string_id),:]=Split24(color,brightness)
    return arr

def ShowDOM(arr,string_id,DOM_id,color,brightness):
    # dimension of arr: slices x LEDs x strings = 1x95x16x3 !
    # sets all LEDs in particular DOM to color
    arr[:,DOM_index(string_id,DOM_id),:,:]=Split24(color,brightness)
    return arr

def AllOn(arr,color,brightness):
    # dimension of arr: slices x LEDs x strings = 1x95x16x3 !
    # sets all strings to color
    arr[:,:,:,:]=Split24(color,brightness)
    return arr

def Instrument(arr,type,brightness):
    if    type == 'pDOM' :
        color=0xff0000   # red                (pDOM)
        ind=[[string_index(87),DOM_index(87,95)],
             [string_index(88),DOM_index(88,83)], 
             [string_index(89),DOM_index(89,47)],
             [string_index(90),DOM_index(90,107)],
             [string_index(91),DOM_index(91,59)],
             [string_index(92),DOM_index(92,35)],
             [string_index(93),DOM_index(93,71)]]
    elif  type == 'mDOM' : 
             color=0x00ff00                      # green              (mDOM)
             s87=string_index(87);s88=string_index(87);s89=string_index(89)
             s90=string_index(90);s91=string_index(91);s92=string_index(92)
             s93=string_index(93)
             d87=DOM_index(87,32);d88=DOM_index(88,32);d89=DOM_index(89,32)
             d90=DOM_index(90,32);d91=DOM_index(91,32);d92=DOM_index(92,32)
             d93=DOM_index(93,32)

             ind=[[s87,d87 -0],[s88,d88 -0],[s89,d89 -0],[s90,d90 -0],[s91,d91 -0],[s92,d92 -0],[s93,d93 -0],\
                  [s87,d87 -2],[s88,d88 -2],[s89,d89 -2],[s90,d90 -2],[s91,d91 -2],[s92,d92 -2],[s93,d93 -2],\
                  [s87,d87 -5],[s88,d88 -5],[s89,d89 -5],[s90,d90 -5],[s91,d91 -5],[s92,d92 -5],[s93,d93 -5],\
                  [s87,d87 -6],[s88,d88 -6],[s89,d89 -6],[s90,d90 -6],[s91,d91 -6],             [s93,d93 -6],\
                  [s87,d87 -8],[s88,d88 -8],[s89,d89 -8],[s90,d90 -8],[s91,d91 -8],[s92,d92 -8],[s93,d93 -8],\
                  [s87,d87 -9],[s88,d88 -9],[s89,d89 -9],[s90,d90 -9],[s91,d91 -9],             [s93,d93 -9],\
                  [s87,d87-11],[s88,d88-11],[s89,d89-11],[s90,d90-11],[s91,d91-11],[s92,d92-11],[s93,d93-11],\
                  [s87,d87-12],[s88,d88-12],[s89,d89-12],[s90,d90-12],[s91,d91-12],[s92,d92-12],[s93,d93-12],\
                  [s87,d87-14],[s88,d88-14],[s89,d89-14],[s90,d90-14],[s91,d91-14],[s92,d92-14],[s93,d93-14],\
                  [s87,d87-17],[s88,d88-17],[s89,d89-17],[s90,d90-17],[s91,d91-17],[s92,d92-17],[s93,d93-17],\
                  [s87,d87-18],[s88,d88-18],             [s90,d90-18],[s91,d91-18],[s92,d92-31],[s93,d93-18],\
                  [s87,d87-20],[s88,d88-20],[s89,d89-20],[s90,d90-20],[s91,d91-20],[s92,d92-20],[s93,d93-20],\
                  [s87,d87-21],[s88,d88-21],[s89,d89-21],[s90,d90-21],[s91,d91-21],[s92,d92-21],[s93,d93-21],\
                  [s87,d87-23],[s88,d88-23],[s89,d89-23],[s90,d90-23],[s91,d91-23],[s92,d92-23],[s93,d93-23],\
                  [s87,d87-24],[s88,d88-24],[s89,d89-24],[s90,d90-24],[s91,d91-24],[s92,d92-24],[s93,d93-24],\
                  [s87,d87-26],[s88,d88-26],[s89,d89-26],[s90,d90-26],[s91,d91-26],[s92,d92-26],[s93,d93-26],\
                  [s87,d87-29],[s88,d88-29],[s89,d89-29],[s90,d90-29],[s91,d91-29],[s92,d92-29],[s93,d93-29],\
                  [s87,d87-30],[s88,d88-30],[s89,d89-30],[s90,d90-30],             [s92,d92-30],[s93,d93-30],\
                  [s87,d87-32],[s88,d88-32],[s89,d89-32],[s90,d90-32],[s91,d91-32],[s92,d92-32],[s93,d93-32],\
                  [s87,d87-33],[s88,d88-33],[s89,d89-33],[s90,d90-33],             [s92,d92-33],[s93,d93-33],\
                  [s87,d87-35],[s88,d88-35],[s89,d89-35],[s90,d90-35],[s91,d91-35],[s92,d92-35],[s93,d93-35],\
                  [s87,d87-36],[s88,d88-36],[s89,d89-36],[s90,d90-36],[s91,d91-36],[s92,d92-36],[s93,d93-36],\
                  [s87,d87-38],[s88,d88-38],[s89,d89-38],[s90,d90-38],[s91,d91-38],[s92,d92-38],[s93,d93-38],\
                  [s87,d87-41],[s88,d88-41],[s89,d89-41],[s90,d90-41],[s91,d91-41],[s92,d92-41],[s93,d93-41],\
                  [s87,d87-42],[s88,d88-42],[s89,d89-42],[s90,d90-42],[s91,d91-42],[s92,d92-42]             ,\
                  [s87,d87-44],[s88,d88-44],[s89,d89-44],[s90,d90-44],[s91,d91-44],[s92,d92-44],[s93,d93-44],\
                  [s87,d87-45],[s88,d88-45],[s89,d89-45],[s90,d90-45],[s91,d91-45],[s92,d92-45]             ,\
                  [s87,d87-47],[s88,d88-47],[s89,d89-47],[s90,d90-47],[s91,d91-47],[s92,d92-47],[s93,d93-47],\
                  [s87,d87-48],[s88,d88-48],[s89,d89-48],[s90,d90-48],[s91,d91-48],[s92,d92-48],[s93,d93-48],\
                  [s87,d87-50],[s88,d88-50],[s89,d89-50],[s90,d90-50],[s91,d91-50],[s92,d92-50],[s93,d93-50],\
                  [s87,d87-53],[s88,d88-53],[s89,d89-53],[s90,d90-53],[s91,d91-53],[s92,d92-53],[s93,d93-53],\
                  [s87,d87-54],             [s89,d89-54],[s90,d90-54],[s91,d91-54],[s92,d92-54]             ,\
                  [s87,d87-56],[s88,d88-56],[s89,d89-56],[s90,d90-56],[s91,d91-56],[s92,d92-56],[s93,d93-56],\
                  [s87,d87-57],             [s89,d89-57],[s90,d90-57],[s91,d91-57],[s92,d92-57],[s93,d93-57],\
                  [s87,d87-59],[s88,d88-59],[s89,d89-59],[s90,d90-59],[s91,d91-59],[s92,d92-59],[s93,d93-59],\
                  [s87,d87-60],[s88,d88-60],[s89,d89-60],[s90,d90-60],[s91,d91-60],[s92,d92-60],[s93,d93-60],\
                  [s87,d87-62],[s88,d88-62],[s89,d89-62],[s90,d90-62],[s91,d91-62],[s92,d92-62],[s93,d93-62],\
                  [s87,d87-65],[s88,d88-65],[s89,d89-65],[s90,d90-65],[s91,d91-65],[s92,d92-65],[s93,d93-65],\
                               [s88,d88-66],[s89,d89-66],[s90,d90-66],[s91,d91-66],[s92,d92-66],[s93,d93-66],\
                  [s87,d87-68],[s88,d88-68],[s89,d89-68],[s90,d90-68],[s91,d91-68],[s92,d92-68],[s93,d93-68],\
                               [s88,d88-69],[s89,d89-69],[s90,d90-69],[s91,d91-69],[s92,d92-69],[s93,d93-69],\
                  [s87,d87-71],             [s89,d89-71],[s90,d90-71],[s91,d91-71],[s92,d92-71],[s93,d93-71],\
                  [s87,d87-72],[s88,d88-72],[s89,d89-72],[s90,d90-72],[s91,d91-72],[s92,d92-72],[s93,d93-72],\
                  [s87,d87-74],[s88,d88-74],[s89,d89-74],[s90,d90-74],[s91,d91-74],[s92,d92-74],[s93,d93-74],\
                  [s87,d87-77],[s88,d88-77],[s89,d89-77],[s90,d90-77],[s91,d91-77],[s92,d92-77],[s93,d93-77],\
                  [s87,d87-78],[s88,d88-78],[s89,d89-78],             [s91,d91-78],[s92,d92-78],[s93,d93-78],\
                  [s87,d87-80],[s88,d88-80],[s89,d89-80],[s90,d90-80],[s91,d91-80],[s92,d92-80],[s93,d93-80],\
                  [s87,d87-81],[s88,d88-81],[s89,d89-81],             [s91,d91-81],[s92,d92-81],[s93,d93-81],\
                  [s87,d87-83],[s88,d88-83],[s89,d89-83],[s90,d90-83],[s91,d91-83],[s92,d92-83],[s93,d93-83],\
                  [s87,d87-84],[s88,d88-84],[s89,d89-84],[s90,d90-84],[s91,d91-84],[s92,d92-84],[s93,d93-84],\
                  [s87,d87-86],[s88,d88-86],[s89,d89-86],[s90,d90-86],[s91,d91-86],[s92,d92-86],[s93,d93-86],\
                  [s87,d87-89],[s88,d88-89],[s89,d89-89],[s90,d90-89],[s91,d91-89],[s92,d92-89],[s93,d93-89]]

    elif  type == 'DEgg' : 
             color=0x0000ff                      # blue               (DEgg)
             s87=string_index(87);s88=string_index(87);s89=string_index(89)
             s90=string_index(90);s91=string_index(91);s92=string_index(92)
             s93=string_index(93)
             d87=DOM_index(87,32);d88=DOM_index(88,32);d89=DOM_index(89,32)
             d90=DOM_index(90,32);d91=DOM_index(91,32);d92=DOM_index(92,32)
             d93=DOM_index(93,32)
             ind=[[s87,d87 -1],[s88,d88 -1],[s89,d89 -1],[s90,d90 -1],[s91,d91 -1],[s92,d92 -1],[s93,d93 -1],\
                  [s87,d87 -3],[s88,d88 -3],[s89,d89 -3],[s90,d90 -3],[s91,d91 -3],[s92,d92 -3],[s93,d93 -3],\
                  [s87,d87 -4],[s88,d88 -4],             [s90,d90 -4],[s91,d91 -4],             [s93,d93 -4],\
                  [s87,d87 -7],[s88,d88 -7],[s89,d89 -7],[s90,d90 -7],[s91,d91 -7],[s92,d92 -7],[s93,d93 -7],\
                  [s87,d87-10],[s88,d88-10],[s89,d89-10],[s90,d90-10],[s91,d91-10],[s92,d92-10],[s93,d93-10],\
                  [s87,d87-13],[s88,d88-13],[s89,d89-13],[s90,d90-13],[s91,d91-13],[s92,d92-13],[s93,d93-13],\
                  [s87,d87-15],[s88,d88-15],             [s90,d90-15],             [s92,d92-15],[s93,d93-15],\
                  [s87,d87-16],[s88,d88-16],[s89,d89-16],[s90,d90-16],[s91,d91-16],[s92,d92-16],[s93,d93-16],\
                  [s87,d87-19],[s88,d88-19],[s89,d89-19],[s90,d90-19],[s91,d91-19],[s92,d92-19],[s93,d93-19],\
                  [s87,d87-22],[s88,d88-22],[s89,d89-22],[s90,d90-22],[s91,d91-22],[s92,d92-22],[s93,d93-22],\
                  [s87,d87-25],[s88,d88-25],[s89,d89-25],[s90,d90-25],[s91,d91-25],[s92,d92-25],[s93,d93-25],\
                  [s87,d87-27],[s88,d88-27],[s89,d89-27],[s90,d90-27],             [s92,d92-27]             ,\
                  [s87,d87-28],[s88,d88-28],[s89,d89-28],[s90,d90-28],[s91,d91-28],[s92,d92-28],[s93,d93-28],\
                  [s87,d87-31],[s88,d88-31],[s89,d89-31],[s90,d90-31],[s91,d91-31],[s92,d92-31],[s93,d93-31],\
                  [s87,d87-34],[s88,d88-34],[s89,d89-34],[s90,d90-34],[s91,d91-34],[s92,d92-34],[s93,d93-34],\
                  [s87,d87-37],[s88,d88-37],[s89,d89-37],[s90,d90-37],[s91,d91-37],[s92,d92-37],[s93,d93-37],\
                  [s87,d87-39],             [s89,d89-39],[s90,d90-39],[s91,d91-39],[s92,d92-39]             ,\
                  [s87,d87-40],[s88,d88-40],[s89,d89-40],[s90,d90-40],[s91,d91-40],[s92,d92-40],[s93,d93-40],\
                  [s87,d87-43],[s88,d88-43],[s89,d89-43],[s90,d90-43],[s91,d91-43],[s92,d92-43],[s93,d93-43],\
                  [s87,d87-46],[s88,d88-46],[s89,d89-46],[s90,d90-46],[s91,d91-46],[s92,d92-46],[s93,d93-46],\
                  [s87,d87-49],[s88,d88-49],[s89,d89-49],[s90,d90-49],[s91,d91-49],[s92,d92-49],[s93,d93-49],\
                                                         [s90,d90-51],[s91,d91-51],[s92,d92-51],[s93,d93-51],\
                  [s87,d87-52],[s88,d88-52],[s89,d89-52],[s90,d90-52],[s91,d91-52],[s92,d92-52],[s93,d93-52],\
                  [s87,d87-55],[s88,d88-55],[s89,d89-55],[s90,d90-55],[s91,d91-55],[s92,d92-55],[s93,d93-55],\
                  [s87,d87-58],[s88,d88-58],[s89,d89-58],[s90,d90-58],[s91,d91-58],[s92,d92-58],[s93,d93-58],\
                               [s88,d88-61],[s89,d89-61],[s90,d90-61],[s91,d91-61],[s92,d92-61],[s93,d93-61],\
                               [s88,d88-63],[s89,d89-63],             [s91,d91-63],             [s93,d93-63],\
                  [s87,d87-64],[s88,d88-64],[s89,d89-64],[s90,d90-64],[s91,d91-64],[s92,d92-64],[s93,d93-64],\
                  [s87,d87-67],[s88,d88-67],[s89,d89-67],[s90,d90-67],[s91,d91-67],[s92,d92-67],[s93,d93-67],\
                  [s87,d87-70],[s88,d88-70],[s89,d89-70],[s90,d90-70],[s91,d91-70],[s92,d92-70],[s93,d93-70],\
                  [s87,d87-73],[s88,d88-73],[s89,d89-73],[s90,d90-73],[s91,d91-73],[s92,d92-73],[s93,d93-73],\
                  [s87,d87-75],[s88,d88-57],[s89,d89-75],             [s91,d91-75],[s92,d92-75],[s93,d93-75],\
                  [s87,d87-76],[s88,d88-76],[s89,d89-76],[s90,d90-76],[s91,d91-76],[s92,d92-76],[s93,d93-76],\
                  [s87,d87-79],[s88,d88-79],[s89,d89-79],[s90,d90-79],[s91,d91-79],[s92,d92-79],[s93,d93-79],\
                  [s87,d87-82],[s88,d88-82],[s89,d89-82],             [s91,d91-82],[s92,d92-82],[s93,d93-82],\
                  [s87,d87-85],[s88,d88-85],[s89,d89-85],[s90,d90-85],[s91,d91-85],[s92,d92-85],[s93,d93-85],\
	          [s87,d87-87],[s88,d88-87],[s89,d89-87],[s90,d90-87],[s91,d91-87],             [s93,d93-87],\
                  [s87,d87-88],[s88,d88-88],[s89,d89-88],[s90,d90-88],[s91,d91-88],[s92,d92-88],[s93,d93-88]]
    elif  type == 'WOM'  :
        color=0xffff00                      # yellow             (WOM)
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
        color=0xd2691e   # brown            (POCAM)
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
             [string_index(93),DOM_index(93,86)]]
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
             [string_index(90),DOM_index(90,110)],
             [string_index(91),DOM_index(91,62)],
             [string_index(92),DOM_index(92,38)],
             [string_index(93),DOM_index(93,74)]]
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
    # arr: 0=slice, 1=LED, 2=string, 3=color
    # note that order of LEDs and strings is reversed  in setting up
    #print(color,brightness,Split24(color,brightness))
    #print("result from indexflat",index_flat(arr.shape[2],arr.shape[1],np.array(ind)))
    temparr   = arr.flatten()
    tempindex = index_flat(arr.shape[2],arr.shape[1],np.array(ind))
    tempcolor = Split24(color,brightness)
    #print(ind,tempindex)
    np.put(temparr,3*tempindex+0,tempcolor[0])  # check!!
    np.put(temparr,3*tempindex+1,tempcolor[1])  # check!!
    np.put(temparr,3*tempindex+2,tempcolor[2])  # check!!
    print(temparr.reshape(1,95,16,3).tolist())
    return  temparr.reshape(1,95,16,3)
