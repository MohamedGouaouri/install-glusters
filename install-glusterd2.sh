#!/bin/bash

echo "Installing packages ..."
sudo apt install -y etcd-server
wget https://github.com/MohamedGouaouri/glusterd2/releases/download/latest/glusterd2.zip

unzip glusterd2.zip
mv build glusterd2
sudo mv glusterd2 /opt/glusterd2
sudo mkdir -p /var/lib/glusterd2
sudo mkdir -p /var/log/glusterd2
sudo mkdir -p /var/run/glusterd2

# TODO: Run this in the background
sudo etcd --name etcd --data-dir /var/lib/glusterd2/store --listen-client-urls http://0.0.0.0:3379 --listen-peer-urls http://0.0.0.0:3380 --advertise-client-urls http://0.0.0.0:3379
# TODO replace IP with the IP of the server
sudo /opt/glusterd2/glusterd2 --noembed --etcdendpoints http://192.168.100.59:3379