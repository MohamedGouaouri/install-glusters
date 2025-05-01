#!/bin/bash

echo "Updating packages ..."
sudo apt update

echo "Installing necessary packages ..."
sudo apt install -y g++ build-essential \
    automake autoconf \
    libtool libtcmalloc-minimal4t64 \
    make libunwind-19 libunwind-dev\
    flex bison \
    libssl-dev \
    pkg-config \
    libuuid1 uuid uuid-dev uuid-runtime \
    libacl1-dev \
    zlib1g-dev \
    libxml2-dev \
    libtirpc-dev \
    liburing2 liburing-dev \
    liburcu-dev \
    glusterfs-server libglusterfs-dev

echo "Cloning glusterfs repo ..."
git clone https://github.com/MohamedGouaouri/glusterfs.git

echo "Checking out to patched branch ..."
cd glusterfs
git checkout release-10

# ./autogen.sh && ./configure LDFLAGS="-L/lib/x86_64-linux-gnu" CFLAGS="-I/usr/include" --with-tcmalloc && make && sudo make install
./autogen.sh && ./configure --with-tcmalloc && sudo make && sudo make install
