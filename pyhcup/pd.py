"""Helper functions for dealing with pandas and numpy"""
import math
import numpy as np

def cast_np_to_py(x):
    """Casts values to native Python types, mainly so they can be passed on as bind params for SQL"""
    int_types = [int, np.int, np.int64, np.int32, np.int16]
    float_types = [float, np.float, np.float64, np.float16, np.float32]
    str_types = [str]
    if type(x) in float_types:
        if math.isnan(x) or np.isnan(x):
            return None
        else:
            return float(x)
    elif type(x) in int_types:
        return int(x)
    elif type(x) in str_types:
        return str(x)
    else:
        return x
