#!/bin/bash

echo "Installing necessary packages ..."
sudo apt install -y libdevmapper-dev liblvm2-dev

echo "Installing lvm2 libraries"
git clone https://github.com/lvmteam/lvm2
cd lvm2
git checkout v2_02_175
./configure && make && sudo make install

sudo cp ~/liblvm2app.so /usr/lib/liblvm2app.so
sudo cp ~/liblvm2app.so.2.2 /usr/lib64/liblvm2app.so.2.2
sudo ldconfig

echo "Installing lvm-proxy tool ..."
git clone https://github.com/phd-uqtr/lvm-proxy.git
cd lvm-proxy
go mod download
go mod tidy

# === test
fallocate -l 4G disk1
sudo losetup -fP disk1
sudo losetup -a
make run

