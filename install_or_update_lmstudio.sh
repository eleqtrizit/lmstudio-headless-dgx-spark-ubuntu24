#!/bin/bash

WHITE='\033[1;37m'
RED='\033[1;31m'
MAGENTA='\033[1;35m'
NC='\033[0m' # No Color


rm -rf arm64* x64* # just in case script was cancelled previously

printf "${MAGENTA}Downloading the latest ${WHITE}LM Studio${NC}\n"
# Detect system architecture and download appropriate LM Studio AppImage
if [ "$(uname -m)" = "aarch64" ]; then
    printf "${MAGENTA}Detected ARM64 architecture${NC}\n"
    wget https://lmstudio.ai/download/latest/linux/arm64 && mv arm64 lmstudio.AppImage
elif [ "$(uname -m)" = "x86_64" ]; then
    printf "${MAGENTA}Detected x86_64 architecture${NC}\n"
    wget https://lmstudio.ai/download/latest/linux/x64 && mv x64 lmstudio.AppImage
else
    printf "${RED}mUnsupported architecture: ${WHITE}$(uname -m)${NC}\n"
    exit 1
fi

./stop.sh
printf "${MAGENTA}Starting to install the latest LM Studio${NC}\n"
rm -rf squashfs-root
chmod 700 lmstudio.AppImage
./lmstudio.AppImage --appimage-extract
rm lmstudio.AppImage

./start.sh
./status.sh
printf "${$MAGENTA}Done${NC}\n"
