FROM debian:stretch-slim

MAINTAINER https://oda-alexandre.github.io

# INSTALLATION DES PREREQUIS
RUN apt-get update && apt-get install --no-install-recommends -y \
sudo \
ca-certificates \
x11-xserver-utils \
dirmngr \
alsa-utils \
libasound2 \
libasound2-plugins \
pulseaudio \
pulseaudio-utils \
libcanberra-gtk-module

# SELECTION DE LA LANGUE FRANCAISE
ENV LANG fr_FR.UTF-8
RUN echo fr_FR.UTF-8 UTF-8 > /etc/locale.gen && locale-gen

# INSTALLATION DE L'APPLICATION
RUN apt-get update && apt-get install -y \
google-chrome-stable

# NETTOYAGE
RUN sudo apt-get --purge autoremove -y \
wget && \
apt-get autoclean -y && \
rm /etc/apt/sources.list && \
rm -rf /var/cache/apt/archives/* && \
rm -rf /var/lib/apt/lists/*

# AJOUT UTILISATEUR
RUN useradd -d /home/chrome -m chrome && \
passwd -d chrome && \
adduser chrome sudo

# SELECTION UTILISATEUR
USER chrome

# SELECTION ESPACE DE TRAVAIL
WORKDIR /home/chrome

# COMMANDE AU DEMARRAGE DU CONTENEUR
CMD /bin/bash
