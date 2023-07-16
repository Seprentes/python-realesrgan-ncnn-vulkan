# python-realesrgan-ncnn-vulkan
Python wrapper for Real-ESRGAN-ncnn-vulkan

## Example Usage
```
from PIL import Image
from realesrgan_ncnn_vulkan import RealESRGAN

realesgran = RealESRGAN()
realesgran.load("<path>/<model_name>.param", "<path>/<model_name>.bin")
realesgran.scale = 4

in_img = Image.open("example.jpg")

out_img = Image.frombytes(
    "RGB",
    (in_img.width * realesgran.scale, in_img.height * realesgran.scale),
    realesgran.process(in_img.width, in_img.height, in_img.tobytes(), 3)
)
out_img.save("output.jpg")
```

## API Reference
```
realesrgan_ncnn_vulkan.RealESRGAN(gpuid, tta_mode=False)
```
Creates a new RealESRGAN object with the specified GPU ID.

```
realesrgan_ncnn_vulkan.RealESRGAN(tta_mode=False)
```
Creates a new RealESRGAN object with the default GPU ID.

```
realesrgan_ncnn_vulkan.RealESRGAN.load(parampath, modelpath)
```
Loads the param and model files which they are required.
The param file must have .param extension and the model file must have .bin extension.

```
realesrgan_ncnn_vulkan.RealESRGAN.process(self, w, h, inimage, c)
```
w is the input width.
h is the input height
inimage is the input image in bytes format.
c is the color number. (For example for RGB c is 3 but for RGBA c is 4.)
Returns output image in bytes format.

```
realesrgan_ncnn_vulkan.RealESRGAN.scale
```
Sets the scale for output.

```
realesrgan_ncnn_vulkan.RealESRGAN.tilesize
```
Sets the tile size.

```
realesrgan_ncnn_vulkan.RealESRGAN.prepadding
```
Sets the prepadding.