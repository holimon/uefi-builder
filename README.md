# Build docker images for compiling UEFI or UBOOT

## How to build
* git clone https://github.com/holimon/uefi-builder.git
* ./resolve.sh
* ./build.sh
> Tip: You can change the GCC cross-compilation toolchain that suits you.
## How to use
Like:
* docker run -it --rm -v ./:/build uefi-builder:v1.0.0
* docker run -it --rm -e AARCH64_GCC=7.5 -v ./:/build uefi-builder:v1.0.0
* docker run -it --rm -e AARCH64_GCC=6.1 -v ./:/build uefi-builder:v1.0.0
* docker run -it --rm -e AARCH64_GCC=4.9 -v ./:/build uefi-builder:v1.0.0