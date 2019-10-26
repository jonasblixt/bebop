FROM ubuntu:xenial

RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt xenial main restricted universe multiverse" > /etc/apt/sources.list && \
    echo "deb mirror://mirrors.ubuntu.com/mirrors.txt xenial-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb mirror://mirrors.ubuntu.com/mirrors.txt xenial-security main restricted universe multiverse" >> /etc/apt/sources.list && \
    DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apt-transport-https \
    tar \
    xz-utils \
    curl \
    sudo \
    automake \
    autopoint \
    libtool \
    ca-certificates \
    git \
    cpio \
    squashfs-tools \
    cryptsetup \
    cryptsetup-bin \
    gettext \
    pkg-config \
    bison \
    python3 \
    python3-ecdsa \
    python3-crypto \
    bc \
    zlib1g-dev \
    pkg-config \
    libssl-dev \
    libpkcs11-helper1 \
    libpkcs11-helper1-dev \
    libblkid1 \
    libblkid-dev \
    bison \
    libfl-dev \
    flex \
    byacc \
    libusb-1.0-0-dev \
    u-boot-tools \
    build-essential \
    device-tree-compiler \
    vim-common \
    zsh \
    lzop \
    libncurses-dev \
    wget \
    python \
    python-crypto \
    python3-pyelftools \
    cryptsetup \
    libcryptsetup-dev \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabihf/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf.tar.xz | tar xJv -C /opt
RUN curl -sL https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-eabi/gcc-linaro-7.4.1-2019.02-x86_64_arm-eabi.tar.xz | tar xJv -C /opt
CMD ["bash", "--rcfile", "/work/sw/setup.sh"]
