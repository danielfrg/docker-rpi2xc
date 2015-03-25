FROM ubuntu:12.04
# FROM debian:wheezy

# RUN dpkg --add-architecture i386
RUN apt-get update && apt-get install -y \
    git \
    rsync \
    cmake \
    ia32-libs
    # libc6-i386 \
    # lib32stdc++6 \
    # zlib1g:i386

RUN git clone git://github.com/raspberrypi/tools.git
ENV PATH="/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin:$PATH"

VOLUME /rootfs
VOLUME /workspace

WORKDIR /workspace
