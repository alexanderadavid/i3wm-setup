#!/bin/sh
# Steps to setup Manjaro

# Install all user installed packages
sudo pacman -S - < .userInstalledPackages

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

# Install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash

# Use zsh
sudo chsh -s $(which zsh) 

# Install extensions for VsCode (not doing this in docker for the sake of space)
if [ -f /.dockerenv ]; then
    echo "Skipping VsCode extensions install";
else
    sh .config/Code/User/userExtensions.sh
fi

echo Done setting up Manjaro!
