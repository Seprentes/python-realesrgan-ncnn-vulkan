cmake_minimum_required(VERSION 3.9)

project(realesrgan_ncnn_vulkan)

find_package(PythonExtensions REQUIRED)
find_package(Cython REQUIRED)
find_package(Vulkan REQUIRED)
find_package(Threads REQUIRED)
find_package(OpenMP REQUIRED)

add_subdirectory(cpp)
add_subdirectory(realesrgan_ncnn_vulkan)
