#!/bin/bash
git clone https://github.com/kmpm/nodemcu-uploader
git clone https://github.com/marcoskirsch/nodemcu-httpserver
cd nodemcu-httpserver
# replace PORT=/dev/cu.SLAB_USBtoUART with PORT=/dev/ttyUSB0
sed -i 's/PORT=\/dev\/cu.SLAB_USBtoUART/PORT=\/dev\/ttyUSB0/g' Makefile
make upload_all
