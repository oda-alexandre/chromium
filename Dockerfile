FROM debian:stretch-slim

MAINTAINER https://www.oda-alexandre.com/

# VARIABLES
ENV USER chromium
ENV LANG fr_FR.UTF-8

# INSTALL OF PACKAGES
RUN apt-get update && apt-get install --no-install-recommends -y \
sudo \
locales \
ca-certificates \
x11-xserver-utils \
dirmngr \
alsa-utils \
libasound2 \
libasound2-plugins \
pulseaudio \
pulseaudio-utils \
libcanberra-gtk-module \
libgtk-3-0 && \

# CHANGE LOCALES
echo ${LANG} > /etc/locale.gen && locale-gen && \

# INSTALL APP
apt-get update && apt-get install -y \
chromium \
chromium-l10n \
chromium-driver && \

# CLEANING
apt-get --purge autoremove -y && \
apt-get autoclean -y && \
rm /etc/apt/sources.list && \
rm -rf /var/cache/apt/archives/* && \
rm -rf /var/lib/apt/lists/* && \

# ADD USER
useradd -d /home/${USER} -m ${USER} && \
passwd -d ${USER} && \
adduser ${USER} sudo

# SELECT USER
USER ${USER}

# SELECT WORKING SPACE
WORKDIR /home/${USER}

# START THE CONTAINER
CMD chromium --temp-profile --no-sandbox
