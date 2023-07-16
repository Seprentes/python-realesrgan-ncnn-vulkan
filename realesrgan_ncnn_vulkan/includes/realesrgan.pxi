from libcpp cimport bool as bool_t
from libcpp.string cimport string
from libcpp.vector cimport vector

cdef extern from "RealESRGANWrapper.hpp":
    cdef cppclass RealESRGANWrapper:
        RealESRGANWrapper(int, bool_t)
        RealESRGANWrapper(bool_t)

        int load(const string&, const string&)
        vector[unsigned char] process(int, int, const vector[unsigned char]&, int)

        int scale
        int tilesize
        int prepadding
