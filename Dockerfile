# Using Docker for smoke tests to ensure no errors when running the setup script
FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive

# Install a subset of userInstalledPackages required to run the smoke test
RUN apt-get update --fix-missing && apt-get install -y \
  sudo \
  python3-pip \
  lightdm \
  git

# Pull down the repo - TODO should pull latest branch or local
RUN git clone https://github.com/alexanderadavid/ubuntu-setup.git

# Working directory is this repo
WORKDIR /ubuntu-setup

# We don't want to blow up our container with all userInstalledPackages.
# Just install the needed ones
RUN echo "python3-pyqt5 \n imagemagick \n curl \n zsh" > .userInstalledPackages

# Overwrite our startup script with this version
COPY setupUbuntu.sh .

# Create a new super user 'docker' so we can 'sudo'
RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER docker

# Allow our entrypoint to run as root
RUN sudo chown root:root setupUbuntu.sh
RUN sudo chmod 4755 setupUbuntu.sh

# Upate path (removes some warnings)
ENV PATH="/home/docker/.local/bin:${PATH}"

# Run our setup script
ENTRYPOINT [ "./setupUbuntu.sh" ]
