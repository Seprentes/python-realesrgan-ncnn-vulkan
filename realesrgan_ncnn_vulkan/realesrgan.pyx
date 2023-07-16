import os.path
import errno

from libcpp.vector cimport vector

include "includes/realesrgan.pxi"

cdef class RealESRGAN:
    cdef RealESRGANWrapper *c_realesrgan

    def __cinit__(self, gpuid, tta_mode=False):
        self.c_realesrgan = new RealESRGANWrapper(gpuid, tta_mode)

    def __cinit__(self, tta_mode=False):
        self.c_realesrgan = new RealESRGANWrapper(tta_mode)

    def __dealloc__(self):
        del self.c_realesrgan

    def load(self, parampath, modelpath):
        if not os.path.isfile(parampath):
            raise FileNotFoundError(errno.ENOENT, os.strerror(errno.ENOENT), parampath)
        elif not os.path.isfile(modelpath):
            raise FileNotFoundError(errno.ENOENT, os.strerror(errno.ENOENT), modelpath)

        self.c_realesrgan.load(parampath.encode(), modelpath.encode())

    def process(self, w, h, inimage, c):
        assert isinstance(inimage, bytes), "Input image must be bytes"
        assert w > 0 and h > 0, "Width and height must must be greater than zero"

        cdef vector[unsigned char] invector = [<unsigned char> byte for byte in inimage];

        return bytes(self.c_realesrgan.process(w, h, invector, c))

    @property
    def scale(self):
        return self.c_realesrgan.scale
    @scale.setter
    def scale(self, int scale):
        self.c_realesrgan.scale = scale

    @property
    def tilesize(self):
        return self.c_realesrgan.tilesize
    @tilesize.setter
    def tilesize(self, int tilesize):
        self.c_realesrgan.tilesize = tilesize

    @property
    def prepadding(self):
        return self.c_realesrgan.prepadding
    @prepadding.setter
    def prepadding(self, int prepadding):
        self.c_realesrgan.prepadding = prepadding
