include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../cpp)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../cpp/Real-ESRGAN-ncnn-vulkan/src)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../cpp/Real-ESRGAN-ncnn-vulkan/src/ncnn/src)
include_directories(${CMAKE_CURRENT_BINARY_DIR}/../cpp/Real-ESRGAN-ncnn-vulkan/src/ncnn/src)
include_directories(${Vulkan_INCLUDE_DIRS})

add_cython_target(realesrgan PY3 CXX)

add_library(realesrgan MODULE ${realesrgan})
target_link_libraries(realesrgan realesrgan-wrapper -static-libstdc++)

python_extension_module(realesrgan)

install(TARGETS realesrgan LIBRARY DESTINATION realesrgan_ncnn_vulkan)
