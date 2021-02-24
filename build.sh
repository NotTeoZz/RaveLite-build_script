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
echo "  Lavender Build script by TeoZz "
echo "${txtrst}"

export CROSS_COMPILE= "Your path to GCC"
export CROSS_COMPILE_ARM32= "Your path to GCC"
export ARCH=arm64 && export SUBARCH=arm64

make O=out lavender-perf_defconfig

export KBUILD_BUILD_USER=TeoZz
export KBUILD_BUILD_HOST=RaveRules

DATE_START=$(date +"%s")

make O=out -j$(nproc --all) | tee kernel.log

echo -e "${bldgrn}"
echo "-------------------"
echo "Build completed in:"
echo "-------------------"
echo -e "${txtrst}"

DATE_END=$(date +"%s")
DIFF=$(($DATE_END - $DATE_START))
echo "Time: $(($DIFF / 60)) minute/s e $(($DIFF % 60)) second."
echo
