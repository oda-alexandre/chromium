# CHROMIUM

![logo](https://assets.gitlab-static.net/uploads/-/system/project/avatar/12904437/Chromium_Material_Icon.png)

- [CHROMIUM](#chromium)
  - [BADGES](#badges)
  - [INTRODUCTION](#introduction)
  - [PREREQUISITES](#prerequisites)
  - [BUILD](#build)
    - [DOCKER RUN](#docker-run)
    - [DOCKER COMPOSE](#docker-compose)
  - [LICENSE](#license)

## BADGES

[![pipeline status](https://gitlab.com/oda-alexandre/chromium/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/chromium/commits/master)

## INTRODUCTION

Docker image of :

- [chromium](https://www.chromium.org)

Continuous integration on :

- [gitlab pipelines](https://gitlab.com/oda-alexandre/chromium/pipelines)

Automatically updated on :

- [docker hub  public](https://hub.docker.com/r/alexandreoda/chromium/).

## PREREQUISITES

- Use [docker](https://www.docker.com)

## BUILD

### DOCKER RUN

```\
docker run -d \
--name chromium \
--group-add audio \
--device /dev/snd \
--cap-add=SYS_ADMIN \
-e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
-e DISPLAY \
-v ${HOME}:/home/chromium \
-v /tmp/.X11-unix/:/tmp/.X11-unix/ \
-v /dev/shm:/dev/shm \
-v /var/run/dbus:/var/run/dbus \
-v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
-v /etc/localtime:/etc/localtime:ro \
-p 80 \
-p 443 \
alexandreoda/chromium
```

### DOCKER COMPOSE

```yml
version: "2.0"

services:
  chromium:
    container_name: chromium
    image: alexandreoda/chromium
    restart: "no"
    privileged: false
    devices:
      - /dev/snd
    cap_add:
      - SYS_ADMIN
    environment:
      - DISPLAY
      - PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native
    volumes:
      - "${HOME}:/home/chromium"
      - "/tmp/.X11-unix/:/tmp/.X11-unix/"
      - "/dev/shm:/dev/shm"
      - "/var/run/dbus:/var/run/dbus"
      - "${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native"
      - "/etc/localtime:/etc/localtime:ro"
    ports:
      - "443"
      - "80"
```

## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/chromium/blob/master/LICENSE)
