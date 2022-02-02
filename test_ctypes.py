import ctypes
import numpy as np
import numpy.ctypeslib as ctl

testlib=ctypes.CDLL('/home/pi/model/test_ctypes.so')
py_print_array=testlib.print_array
py_print_array.argtypes = [ctl.ndpointer(np.float64,flags='aligned,c_contiguous'),ctypes.c_int]
A=np.array([1.3,2.51,3.6],dtype=np.float64)
py_print_array(A,3)

