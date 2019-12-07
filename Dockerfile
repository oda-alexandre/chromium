FROM debian:stretch-slim

LABEL authors https://www.oda-alexandre.com/

ENV USER chromium
ENV LANG fr_FR.UTF-8

RUN echo -e '\033[36;1m ******* INSTALL PACKAGES ******** \033[0m'; \
apt update && apt install --no-install-recommends -y \
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
libgtk-3-0

RUN echo -e '\033[36;1m ******* CHANGE LOCALES ******** \033[0m'; \
echo ${LANG} > /etc/locale.gen && locale-gen

RUN echo -e '\033[36;1m ******* INSTALL APP ******** \033[0m'; \
apt update && apt install -y \
chromium \
chromium-l10n \
chromium-driver

RUN echo -e '\033[36;1m ******* CLEANING ******** \033[0m'; \
apt-get --purge autoremove -y; \
apt-get autoclean -y; \
rm /etc/apt/sources.list; \
rm -rf /var/cache/apt/archives/*; \
rm -rf /var/lib/apt/lists/*

RUN echo -e '\033[36;1m ******* ADD USER ******** \033[0m'; \
useradd -d /home/${USER} -m ${USER}; \
passwd -d ${USER}; \
adduser ${USER} sudo

RUN echo -e '\033[36;1m ******* SELECT USER ******** \033[0m'
USER ${USER}

RUN echo -e '\033[36;1m ******* SELECT WORKING SPACE ******** \033[0m'
WORKDIR /home/${USER}

RUN echo -e '\033[36;1m ******* CONTAINER START COMMAND ******** \033[0m'
CMD chromium --temp-profile --no-sandbox \