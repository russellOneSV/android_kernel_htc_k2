#!/bin/bash
rm output/files/system/lib/modules/*
make clean
make mrproper
make operaul_defconfig
make -j9
mkdir output
mkdir output/files/system
mkdir output/files/system/lib
mkdir output/files/system/lib/modules
find . -name '*.ko' -exec cp '{}' output/files/system/lib/modules \;
