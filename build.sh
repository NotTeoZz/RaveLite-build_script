#!/bin/bash

# colorize and add text parameters
grn=$(tput setaf 2)             # green
yellow=$(tput setaf 3)          # yellow
bldgrn=${txtbld}$(tput setaf 2) # bold green
red=$(tput setaf 1)             # red
txtbld=$(tput bold)             # bold
bldblu=${txtbld}$(tput setaf 4) # bold blue
blu=$(tput setaf 4)             # blue
txtrst=$(tput sgr0)             # reset
blink=$(tput blink)             # blink

echo "$(tput setaf 2)"
echo "  Lavender Build script by Peppe289 "
echo "${txtrst}"

export CROSS_COMPILE=/home/matteo/Scrivania/Build/aarch64-linux-android-4.9/bin/aarch64-linux-android-
export CROSS_COMPILE_ARM32=/home/matteo/Scrivania/Build/arm-eabi-4.8/bin/arm-eabi-gcc-
export ARCH=arm64 && export SUBARCH=arm64

make O=out lavender-perf_defconfig
make O=out menuconfig

export KBUILD_BUILD_USER=TeoZz
export KBUILD_BUILD_HOST=RaveRules

DATE_START=$(date +"%s")

make O=out -j8 | tee kernel.log

echo -e "${bldgrn}"
echo "-------------------"
echo "Build completato in:"
echo "-------------------"
echo -e "${txtrst}"

DATE_END=$(date +"%s")
DIFF=$(($DATE_END - $DATE_START))
echo "Time: $(($DIFF / 60)) minuto/i e $(($DIFF % 60)) secondi."
echo
