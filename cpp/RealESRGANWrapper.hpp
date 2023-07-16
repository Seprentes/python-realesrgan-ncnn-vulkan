#ifndef REALESRGANWRAPPER_H
#define REALESRGANWRAPPER_H

#include <vector>

#include "realesrgan.h"

class RealESRGANWrapper : public RealESRGAN
{
public:
    RealESRGANWrapper(int gpuid, bool tta_mode = false);
    RealESRGANWrapper(bool tta_mode = false) : RealESRGANWrapper(ncnn::get_default_gpu_index(), tta_mode) {}

    std::vector<unsigned char> process(int w, int h, const std::vector<unsigned char> &inimage, int c);
};

#endif //REALESRGANWRAPPER_H
