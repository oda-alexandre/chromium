FROM debian:stretch-slim

MAINTAINER https://oda-alexandre.github.io

# INSTALLATION DES PREREQUIS
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
libgtk-3-0

# SELECTION DE LA LANGUE FRANCAISE
ENV LANG fr_FR.UTF-8
RUN echo fr_FR.UTF-8 UTF-8 > /etc/locale.gen && locale-gen

# INSTALLATION DE L'APPLICATION
RUN apt-get update && apt-get install -y \
chromium \
chromium-l10n \
chromium-driver

# NETTOYAGE
RUN apt-get --purge autoremove -y && \
apt-get autoclean -y && \
rm /etc/apt/sources.list && \
rm -rf /var/cache/apt/archives/* && \
rm -rf /var/lib/apt/lists/*

# AJOUT UTILISATEUR
RUN useradd -d /home/chromium -m chromium && \
passwd -d chromium && \
adduser chromium sudo

# SELECTION UTILISATEUR
USER chromium

# SELECTION ESPACE DE TRAVAIL
WORKDIR /home/chromium

# COMMANDE AU DEMARRAGE DU CONTENEUR
CMD chromium --temp-profile --no-sandbox
