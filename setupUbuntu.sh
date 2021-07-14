# Scripts to setup ubuntu live here

# Install all user installed packages
apt-get install $(grep -vE "^\s*#" userInstalledPackages  | tr "\n" " ")

# Install some python libs needed for our scripts
pip3 install bs4

# Copy root configs
sudo cp -a .etc.lightdm/* /etc/lightdm

# Link wal's Xresources to ours to give our terminal wal gerated colors
ln -s ~/.cache/wal/colors.Xresources ~/.Xresources -f

# Allow our scripts to update the lightdm background pic
if [ ! -f /usr/share/backgrounds/lightdm.png ]; then
  convert -size 32x32 xc:white /usr/share/backgrounds/lightdm.png 
fi
sudo chmod 777 /usr/share/backgrounds/lightdm.png

# TODO install zsh