# Using Docker for smoke tests to ensure no errors when running the setup script
FROM archlinux:latest

RUN pacman -Syu --noconfirm which sudo python-pip lightdm git

# Pull down the repo - TODO should pull latest branch or local
RUN git clone -b manjaro https://github.com/alexanderadavid/i3wm-setup.git

# Working directory is this repo
WORKDIR /i3wm-setup

# We don't want to blow up our container with all userInstalledPackages.
# Just install the needed ones
RUN echo "python3-pyqt5 \n imagemagick \n curl \n zsh" > .userInstalledPackages

# Overwrite our startup script with this version
COPY setupManjaro.sh .

# TODO use useradd to setup a root user
# RUN useradd -m -G groupname -s bash username

# Run our setup script
ENTRYPOINT [ "./setupManjaro.sh" ]
