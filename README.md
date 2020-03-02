# CHROMIUM

![logo](https://assets.gitlab-static.net/uploads/-/system/project/avatar/12904437/Chromium_Material_Icon.png)

## INDEX

- [CHROMIUM](#chromium)
  - [INDEX](#index)
  - [BADGES](#badges)
  - [FIRST UPDATE](#first-update)
  - [INTRODUCTION](#introduction)
  - [PREREQUISITES](#prerequisites)
  - [INSTALL](#install)
  - [LICENSE](#license)

## BADGES

[![pipeline status](https://gitlab.com/oda-alexandre/chromium/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/chromium/commits/master)

## FIRST UPDATE

Date: 01-01-01

## INTRODUCTION

Docker image of :

- [chromium](https://www.chromium.org)

Continuous integration on :

- [gitlab](https://gitlab.com/oda-alexandre/chromium/pipelines)

Automatically updated on :

- [docker hub  public](https://hub.docker.com/r/alexandreoda/chromium/).

## PREREQUISITES

- Use [docker](https://www.docker.com)

## INSTALL

```docker run -d --name chromium -v ${HOME}:/home/chromium -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /dev/snd:/dev/snd -v /dev/shm:/dev/shm -v /var/run/dbus:/var/run/dbus -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native --group-add $(getent group audio | cut -d: -f3) --network host -e DISPLAY alexandreoda/chromium```

## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/chromium/blob/master/LICENSE)
