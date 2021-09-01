#!/bin/sh

# pfSense_gui_branch represents the branch of pfSense GUI that will be compiled, with "RELENG" replaced by "v" : master for a development ISO, v2_5_0 for a stable ISO
# pfSense_port_branch represents the branch of FreeBSD ports that will be compiled, using the same replacement ("RELENG"=>"v") : devel for a development ISO, v2_5_0 for a stable ISO
# product_name represents the name of your product.

set pfSense_gui_branch=v2_5_0 # Replace with the version you want to build
set pfSense_port_branch=v2_5_0 # Replace with the version you want to build
set product_name=viraWall # Replace with your product name


cd /usr/local/www/nginx/
rm -rf *
mkdir -p packages
# Ports web server for core PKGs (pfSense-base, pfSense-rc, etc...)
ln -s /root/pfsense/tmp/${product_name}_${pfSense_gui_branch}_amd64-core/.latest packages/${product_name}_${pfSense_gui_branch}_amd64-core
# Ports web server for other PKGs
ln -s /usr/local/poudriere/data/packages/${product_name}_${pfSense_gui_branch}_amd64-${product_name}_${pfSense_port_branch} packages/${product_name}_${pfSense_gui_branch}_amd64-${product_name}_${pfSense_port_branch} 
# Web server for monitoring ports build
ln -s /usr/local/poudriere/data/logs/bulk/${product_name}_${pfSense_gui_branch}_amd64-${product_name}_${pfSense_port_branch}/latest poudriere

# Allow directory indexing, and configure nginx to start automatically on boot
sed -i '' 's+/usr/local/www/nginx;+/usr/local/www/nginx; autoindex on;+g' /usr/local/etc/nginx/nginx.conf
echo nginx_enable=\"YES\" >> /etc/rc.conf
service nginx restart
