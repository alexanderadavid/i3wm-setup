#!/bin/sh
# Steps to setup ubuntu

# Install all user installed packages
sudo apt-get install -y $(grep -vE "^\s*#" .userInstalledPackages  | tr "\n" " ")

# Install some python libs needed for our scripts
pip3 install bs4
pip3 install pywal

sudo cp -r . ~

# Copy root configs
sudo cp -a .etc.lightdm/* /etc/lightdm

# Link wal's Xresources to ours to give our terminal wal gerated colors
if [ ! -f ~/.cache/wal/colors.Xresources ]; then
  ln -s ~/.cache/wal/colors.Xresources ~/.Xresources -f
fi

# Allow our scripts to update the lightdm background pic
if [ ! -f /usr/share/backgrounds/lightdm.png ]; then
  sudo convert -size 32x32 xc:white /usr/share/backgrounds/lightdm.png 
fi
sudo chmod 777 /usr/share/backgrounds/lightdm.png

# TODO install zsh

echo Done setting up ubuntu!
