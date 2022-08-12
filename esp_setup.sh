#!/bin/sh
# Boris Nimcevic
# 2022 February 19

# preprequisites
sudo apt-get install git wget flex bison gperf python3 python3-pip python3-setuptools cmake ninja-build ccache libffi-dev libssl-dev dfu-util libusb-1.0-0

# thet the repo
mkdir -p ~/esp
cd ~/esp
git clone --recursive https://github.com/espressif/esp-idf.git

# install tools
cd ~/esp/esp-idf
./install.sh esp32c3

# In the terminal where you are going to use ESP-IDF, run:
# . $HOME/esp/esp-idf/export.sh
