FROM debian:stretch-slim

MAINTAINER https://www.oda-alexandre.com/

# VARIABLES
ENV USER chromium
ENV LANG fr_FR.UTF-8

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
libgtk-3-0 && \

# SELECTION DE LA LANGUE FRANCAISE
echo ${LANG} > /etc/locale.gen && locale-gen && \

# INSTALLATION DE L'APPLICATION
apt-get update && apt-get install -y \
chromium \
chromium-l10n \
chromium-driver && \

# NETTOYAGE
apt-get --purge autoremove -y && \
apt-get autoclean -y && \
rm /etc/apt/sources.list && \
rm -rf /var/cache/apt/archives/* && \
rm -rf /var/lib/apt/lists/* && \

# AJOUT UTILISATEUR
useradd -d /home/${USER} -m ${USER} && \
passwd -d ${USER} && \
adduser ${USER} sudo

# SELECTION UTILISATEUR
USER ${USER}

# SELECTION ESPACE DE TRAVAIL
WORKDIR /home/${USER}

# COMMANDE AU DEMARRAGE DU CONTENEUR
CMD chromium --temp-profile --no-sandbox
