#include "RealESRGANWrapper.hpp"

RealESRGANWrapper::RealESRGANWrapper(int gpuid, bool tta_mode) : RealESRGAN(gpuid, tta_mode)
{
    uint32_t heap_budget = ncnn::get_gpu_device(gpuid)->get_heap_budget();

    if (heap_budget > 1900)
        RealESRGAN::tilesize = 200;
    else if (heap_budget > 550)
        RealESRGAN::tilesize = 100;
    else if (heap_budget > 190)
        RealESRGAN::tilesize = 64;
    else
        RealESRGAN::tilesize = 32;

    RealESRGAN::prepadding = 10;
}

std::vector<unsigned char> RealESRGANWrapper::process(int w, int h, const std::vector<unsigned char> &inimage, int c)
{
    ncnn::Mat in = ncnn::Mat(w, h, (void *)inimage.data(), (size_t)c, c);
    ncnn::Mat out = ncnn::Mat(w * scale, h * scale, (size_t)c, c);

    RealESRGAN::process(in, out);

    return std::vector<unsigned char>((unsigned char *)out.data, (unsigned char *)out.data + out.total() * c);
}
