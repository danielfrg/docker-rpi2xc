FROM ubuntu:12.04
# FROM debian:wheezy

# RUN dpkg --add-architecture i386
RUN apt-get update && apt-get install -y \
    git \
    rsync \
    make \
    cmake \
    ia32-libs

RUN git clone git://github.com/raspberrypi/tools.git

ENV PATH="/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin:$PATH"
ENV AR="/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-ar"
ENV CC="/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-gcc"
ENV CXX="/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-g++"

VOLUME /rootfs
VOLUME /workspace

WORKDIR /workspace
