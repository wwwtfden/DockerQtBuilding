ARG BASE_IMAGE=ubuntu:22.04
FROM $BASE_IMAGE as base
ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
        python3-pip \
        build-essential \
        libgl1-mesa-dev \
        libfontconfig1-dev \
        libfreetype6-dev \
        libx11-dev \
        libx11-xcb-dev \
        libxext-dev \
        libxfixes-dev \
        libxi-dev \
        libxrender-dev \
        libxcb1-dev \
        libxcb-glx0-dev \
        libxcb-keysyms1-dev \
        libxcb-image0-dev \
        libxcb-shm0-dev \
        libxcb-icccm4-dev \
        libxcb-sync-dev \
        libxcb-xfixes0-dev \
        libxcb-shape0-dev \
        libxcb-randr0-dev \
        libxcb-render-util0-dev \
        libxcb-util-dev \
        libxcb-xinerama0-dev \
        libxcb-xkb-dev \
        libxkbcommon-dev \
        libxkbcommon-x11-dev \
        git \
        wget && \
    apt-get -qq clean && \
    rm -rf /var/lib/apt/lists/*
RUN pip3 install --upgrade pip
RUN pip3 install cmake ninja

# Download Qt

RUN mkdir /workspace
WORKDIR /workspace
RUN wget https://qt-mirror.dannhauer.de/official_releases/qt/6.6/6.6.1/single/qt-everywhere-src-6.6.1.tar.xz

RUN tar -xf qt-everywhere-src-6.6.1.tar.xz
WORKDIR /workspace/qt-everywhere-src-6.6.1

# Build Qt
RUN mkdir build
WORKDIR /workspace/qt-everywhere-src-6.6.1/build
RUN ../configure
RUN cmake --build . --parallel
#WORKDIR /workspace/qt-everywhere-src-6.6.1
#RUN tar -czvf qt_build.tar.gz build
#RUN cmake --install . --prefix /usr/local/qt6

