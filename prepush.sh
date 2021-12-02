#!/bin/sh

# Save VsCode extensions
code --list-extensions | xargs -L 1 echo code --install-extension > ~/.config/Code/User/userExtensions.sh

# Save user installed packages
pacman -Qet | awk '{print $1}' > .userInstalledPackages

# Update our lightdm config
cp -r /etc/lightdm/lightdm.conf ~/.etc.lightdm 
cp -r /etc/lightdm/lightdm-slick-greeter.conf ~/.etc.lightdm 
cp /etc/lightdm/Xsession .etc.lightdm
