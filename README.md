# CHROMIUM

[![dockeri.co](https://dockeri.co/image/alexandreoda/chromium)](https://hub.docker.com/r/alexandreoda/chromium)


## INDEX

- [Badges](#BADGES)
- [Introduction](#INTRODUCTION)
- [Prerequis](#PREREQUIS)
- [Installation](#INSTALLATION)
- [License](#LICENSE)


## BADGES

[![version](https://images.microbadger.com/badges/version/alexandreoda/chromium.svg)](https://microbadger.com/images/alexandreoda/chromium)
[![size](https://images.microbadger.com/badges/image/alexandreoda/chromium.svg)](https://microbadger.com/images/alexandreoda/chromium")
[![build](https://img.shields.io/docker/build/alexandreoda/chromium.svg)](https://hub.docker.com/r/alexandreoda/chromium)
[![automated](https://img.shields.io/docker/automated/alexandreoda/chromium.svg)](https://hub.docker.com/r/alexandreoda/chromium)


## INTRODUCTION

Ce repository contient le fichier Dockerfile de
- [chromium](https://www.chromium.org)

Mis à jour automatiquement dans le [docker hub  public](https://hub.docker.com/r/alexandreoda/chromium/).


## PREREQUIS

Installer [docker](https://www.docker.com)


## INSTALLATION

```
docker run -d --name chromium -v ${HOME}:/home/chromium -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /dev/snd:/dev/snd -v /dev/shm:/dev/shm -v /var/run/dbus:/var/run/dbus -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native --group-add $(getent group audio | cut -d: -f3) --network host -e DISPLAY alexandreoda/chromium
```


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://github.com/oda-alexandre/chromium/blob/master/LICENSE)
