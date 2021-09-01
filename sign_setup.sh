#!/bin/sh

mkdir -p /root/sign/
cp sign.sh /root/sign/sign.sh

cd /root/sign/
openssl genrsa -out repo.key 2048
chmod 0400 repo.key
openssl rsa -in repo.key -out repo.pub -pubout
printf "function: sha256\nfingerprint: `sha256 -q repo.pub`\n" > fingerprint

chmod +x /root/sign/sign.sh
