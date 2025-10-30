#!/bin/bash


OS=$(grep ^ID= /etc/os-release | cut -d= -f2 | tr -d '"')

if [ "$OS" = "ubuntu" ]; then
    sudo apt update
    sudo apt install -y xvfb xauth wget
elif [ "$OS" = "arch" ]; then
    sudo pacman -Sy --noconfirm xorg-server-xvfb xorg-xauth wget
else
    echo "Unsupported OS: $OS"
    exit 1
fi

sudo cp *service /etc/systemd/user/
