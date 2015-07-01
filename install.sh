#!/bin/bash

username=$USER
currdir=`pwd`

echo "USERNAME="$username
echo "DIR="$currdir

trap "exit" SIGHUP SIGINT SIGTERM

echo "-----------------------------------------------------------"
echo "| ESP8266 Setup Environment Script                        |"
echo "-----------------------------------------------------------"
echo "ESP8266 Wifi module SDK installation script!"
echo "Source: https://github.com/pfalcon/esp-open-sdk"

echo "-----------------------------------------------------------"
echo "* Install Linux Debian depencies"
echo "-----------------------------------------------------------"
sudo apt-get install -y make wget unrar-free autoconf automake build-essential libc6-dev \
    libtool libtool-bin gcc g++ gperf git flex bison texinfo gawk python sed python-serial \
    ncurses-dev libexpat-dev
    #libncurses5-dev libexpat1-dev

echo "-----------------------------------------------------------"
echo "* Git clone esp-open-sdk"
echo "-----------------------------------------------------------"

git clone https://github.com/pfalcon/esp-open-sdk
cd esp-open-sdk
git submodule init
git submodule update

echo "-----------------------------------------------------------"
echo "* Make esp-open-sdk"
echo "-----------------------------------------------------------"

make clean
make STANDALONE=y

echo "-----------------------------------------------------------"
echo "* Add CT-NG tool location to PATH"
echo "-----------------------------------------------------------"

xtpath=$PWD/xtensa-lx106-elf/bin
search=`cat ~/.bashrc | grep $xtpath`
echo $search

if [ -z "$search" ]
then
echo "-----------------------------------------------------------"
echo "* Set CT-NG tool location in ~/.bashrc"
echo "-----------------------------------------------------------"

  echo "PATH Before source: "$PATH

  echo "" >> ~/.bashrc
  echo 'export PATH=$PATH:'$xtpath >> ~/.bashrc
  source ~/.bashrc
  exec bash

  echo "PATH After source: "$PATH
else
  echo "CT-NG tool location already set in ~/.bashrc"
fi
