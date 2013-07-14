#!/bin/bash
rm output/system/lib/modules/*.ko
rm output/kernel/zImage
make clean
make mrproper
make k2_ul_defconfig
make -j9
cp arch/arm/boot/zImage output/kernel/zImage
find . -name '*.ko' -exec cp {} output/system/lib/modules/  \;
cd output/system/app/
rm JmzSettings.apk
wget https://dl.dropboxusercontent.com/u/28491940/JmzSettings.apk
cd ../../
NOW=$(date +"%m-%d-%y")
zip -r JmzK2_Kernel-"$NOW".zip *
