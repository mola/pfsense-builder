#!/bin/sh

set product_name=viraWall

cd /root
git clone https://github.com/mola/pfsense.git
cd pfsense
git checkout RELENG_2_5_0 # Replace by the branch of pfSense GUI to build.

# Ports repositories signing key
rm src/usr/local/share/${product_name}/keys/pkg/trusted/*
cp /root/sign/fingerprint src/usr/local/share/${product_name}/keys/pkg/trusted/fingerprint
