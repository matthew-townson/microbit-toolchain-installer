#!/bin/bash
echo "=======================================================================
_     arm toolchain installer script for micro:bit systems
          | |                                                          
 _ __ ___ | |_ _____      ___ __  ___  ___  _ __    ___ ___  _ __ ___  
| '_ ' _ \| __/ _ \ \ /\ / | '_ \/ __|/ _ \| '_ \  / __/ _ \| '_ ' _ \ 
| | | | | | || (_) \ V  V /| | | \__ | (_) | | | || (_| (_) | | | | | |
|_| |_| |_|\__\___/ \_/\_/ |_| |_|___/\___/|_| |_(_\___\___/|_| |_| |_|
======================================================================="

echo "
updating package repository"
sleep 5
sudo apt update && sudo apt upgrade -y
echo "
installing required packages: wget, git, build-essential, srecord, python3, python3-pip, openocd, libncurses5, libncurses5-dev"
sleep 2
sudo apt-get install -y --no-install-recommends wget git build-essential srecord python3 python3-pip openocd libncurses5 libncurses5-dev
echo "
changing default python version to python3"
sleep 1
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
wait
echo "
downloading arm gnu toolchain (gcc-arm-non-eabi-10-2020-q4-major-x86_64)"
wait
cd /opt/
sleep 1
sudo wget -q https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2?revision=ca0cbf9c-9de2-491c-ac48-898b5bbc0443&rev=ca0cbf9c9de2491cac48898b5bbc0443&hash=0C735F2481B3EDAB54EF4E68321CE01F
wait
echo "
extracting"
sleep 1
sudo tar -xf gcc-arm-none-eabi*
wait
echo "
cleanup"
sudo rm gcc-arm*.tar.bz2*
wait
echo "
adding toolchain to path"
sleep 1
export PATH=/opt/gcc-arm-none-eabi-10-2020-q4-major/bin:$PATH
wait
sudo echo PATH=/opt/gcc-arm-none-eabi-10-2020-q4-major/bin/:\$PATH >> ~/.bashrc
cd ~
echo "
Installation complete! - if this helped you, please star this on github https://github.com/matthew-townson/microbit-toolchain-installer/"
