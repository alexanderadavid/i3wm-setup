#!/bin/sh

# Save VsCode extensions
code --list-extensions | xargs -L 1 echo code --install-extension > ~/.config/Code/User/userExtensions.sh

# Save user installed packages
apt-mark showmanual > ~/.userInstalledPackages
