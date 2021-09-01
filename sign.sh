#!/bin/sh
read -t 2 sum
[ -z "$sum" ] && exit 1
echo SIGNATURE
echo -n $sum | openssl dgst -sign /root/sign/repo.key -sha256 -binary
echo
echo CERT
cat /root/sign/repo.pub
echo END