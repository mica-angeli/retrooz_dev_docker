# RetroOZ Development Docker

This repository contains the Dockerfile necessary to build 32-bit and 64-bit ARM Linux Docker images that contain all the necessary dependencies to build applications for [RetroOZ](https://github.com/southoz/RetroOZ/wiki).

The following applications have been tested to compile without needing to setup any extra dependencies:

* [retrorun](https://github.com/JuanMiguelBG/retrorun-go2-ogs)
* [ogage](https://github.com/JuanMiguelBG/ogage)

## How to use the image

### 32-bit ARM

Download the prebuilt image and run the Docker container using:

```bash
docker pull rangeli93/retrooz_dev:arm32
docker run --privileged -it --name retrooz32 rangeli93/retrooz_dev:arm32 bash
```

For example to build Retrorun, execute the following within the Docker container:

```bash
git clone https://github.com/JuanMiguelBG/retrorun-go2-ogs.git
cd retrorun-go2-ogs
make config=release
```

Then execute this on your host OS to copy the resulting binary out of the Docker container and into your host OS:

```bash
docker cp retrooz32:/root/retrorun-go2-ogs/retrorun retrorun32
```

### 64-bit ARM

Download the prebuilt image and run the Docker container using:

```bash
docker pull rangeli93/retrooz_dev:arm64
docker run --privileged -it --name retrooz64 rangeli93/retrooz_dev:arm64 bash
```

For example to build Retrorun, execute the following within the Docker container:

```bash
git clone https://github.com/JuanMiguelBG/retrorun-go2-ogs.git
cd retrorun-go2-ogs
make config=release
```

Then execute this on your host OS to copy the resulting binary out of the Docker container and into your host OS:

```bash
docker cp retrooz64:/root/retrorun-go2-ogs/retrorun retrorun
```

## How to build the image

### 32-bit ARM

Execute the following on your machine:

```bash
git clone https://github.com/rangeli/retrooz_dev_docker.git
cd retrooz_dev_docker
docker build . --platform linux/arm/v7 -t rangeli93/retrooz_dev:arm32
```

### 64-bit ARM

Execute the following on your machine:

```bash
git clone https://github.com/rangeli/retrooz_dev_docker.git
cd retrooz_dev_docker
docker build . --platform linux/arm64 -t rangeli93/retrooz_dev:arm64
```
