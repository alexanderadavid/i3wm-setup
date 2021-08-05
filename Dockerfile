# Using Docker for smoke tests to ensure no errors when running the setup script
FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive

# Install a subset of userInstalledPackages required to run the smoke test
RUN apt-get update --fix-missing && apt-get install -y \
  sudo \
  python3-pip \
  lightdm \
  git

RUN git clone https://github.com/alexanderadavid/ubuntu-setup.git

# We don't want to blow up our container with all userInstalledPackages.
# Just install the needed ones
RUN echo "python3-pyqt5 \n imagemagick" > ubuntu-setup/userInstalledPackages

# Overwrite our startup script with this version
COPY setupUbuntu.sh ./ubuntu-setup

# Create a new super user 'docker' so we can 'sudo'
RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER docker

# Run our setup script
RUN cd ubuntu-setup && sudo sh setupUbuntu.sh
