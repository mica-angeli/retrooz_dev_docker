FROM arm32v7/ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York
RUN apt update && \
    apt install -y \
    sudo \
    git \
    curl \
    nano \
    wget \
    build-essential \
    brightnessctl \
    rustc \
    autotools-dev \
    automake \
    libtool \
    libtool-bin \
    libevdev-dev \
    libdrm-dev \
    python3 \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    ninja-build \
    libopenal-dev \
    premake4 \
    autoconf \
    ffmpeg \
    libsnappy-dev \
    libboost-tools-dev \
    magics++ \
    libboost-thread-dev \
    libboost-all-dev \
    pkg-config \
    zlib1g-dev \
    libpng-dev \
    libsdl2-dev \
    clang \
    cmake \
    cmake-data \
    libarchive13 \
    libcurl4 \
    libfreetype6-dev \
    libjsoncpp1 \
    librhash0 \
    libuv1 \
    mercurial \
    mercurial-common \
    libgbm-dev \
    libsdl2-ttf-2.0-0 \
    libsdl2-ttf-dev

RUN apt update

RUN ln -s /usr/include/libdrm/ /usr/include/drm

# Install meson
RUN pip3 install meson
WORKDIR /root
RUN git clone https://github.com/mesonbuild/meson.git && \
    cd meson && \
    ln -s /meson/meson.py /usr/bin/meson

# Install librga
WORKDIR /root
RUN git clone https://github.com/rockchip-linux/linux-rga.git && \
    cd linux-rga && \
    meson builddir && \
    cd builddir && \
    meson compile && \
    meson install

# Install libgo2
WORKDIR /root
RUN git clone https://github.com/OtherCrashOverride/libgo2.git && \
    cd libgo2 && \
    mkdir -p /usr/include/go2 && \
    cp src/*.h /usr/include/go2/

# Get Rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y

ENV PATH="/root/.cargo/bin:${PATH}"
