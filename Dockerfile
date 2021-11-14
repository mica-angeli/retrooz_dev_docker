FROM arm32v7/ubuntu:20.04

RUN apt update && \
    apt install -y \
    sudo \
    build-essential \
    brightnessctl \
    rustc \
    autotools-dev \
    automake \
    libtool \
    libtool-bin \
    libevdev-dev

RUN apt update

# Get Rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y

ENV PATH="/root/.cargo/bin:${PATH}"
