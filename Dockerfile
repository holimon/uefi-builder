FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak && sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN apt-get update \
    && apt-get -y install python3 python3-distutils python3-pil python3-git \
    && apt-get -y install build-essential uuid-dev iasl nasm bc abootimg locales tzdata wget vim-common libssl-dev bison flex \
    && apt-get -y install libncurses5-dev
RUN locale-gen en_US.UTF-8 \
    && ln -s /usr/bin/python3 /usr/bin/python \
    && cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime


ADD gcc-linaro-4.9.4-2017.01-x86_64_aarch64-linux-gnu.tar.xz /opt
ADD gcc-linaro-6.1.1-2016.08-x86_64_aarch64-linux-gnu.tar.xz /opt
ADD gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu.tar.xz /opt

RUN mv /opt/gcc-linaro-4.9.4-2017.01-x86_64_aarch64-linux-gnu /opt/gcc-linaro-4.9 \
    && mv /opt/gcc-linaro-6.1.1-2016.08-x86_64_aarch64-linux-gnu /opt/gcc-linaro-6.1 \
    && mv /opt/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu /opt/gcc-linaro-7.5

ENV AARCH64_GCC=6.1
ENV LANG en_US.utf8
ENV CROSS_COMPILE=aarch64-linux-gnu-

WORKDIR /build
ENTRYPOINT export PATH=$PATH:/opt/gcc-linaro-${AARCH64_GCC}/bin && /bin/bash