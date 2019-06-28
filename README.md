# CHROMIUM

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Chromium_Material_Icon.png/220px-Chromium_Material_Icon.png" width="200" height="200"/>


## INDEX

- [Badges](#BADGES)
- [Introduction](#INTRODUCTION)
- [PREREQUISITESites](#PREREQUISITESITES)
- [Install](#INSTALL)
- [License](#LICENSE)


## BADGES

[![pipeline status](https://gitlab.com/oda-alexandre/chromium/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/chromium/commits/master)


## INTRODUCTION

Docker image of :

- [chromium](https://www.chromium.org)

Continuous integration on :

- [gitlab](https://gitlab.com/oda-alexandre/chromium/pipelines)

automatically updated on :

- [docker hub  public](https://hub.docker.com/r/alexandreoda/chromium/).


## PREREQUISITES

- Use [docker](https://www.docker.com)


## INSTALL

```
docker run -d --name chromium -v ${HOME}:/home/chromium -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /dev/snd:/dev/snd -v /dev/shm:/dev/shm -v /var/run/dbus:/var/run/dbus -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native --group-add $(getent group audio | cut -d: -f3) --network host -e DISPLAY alexandreoda/chromium
```


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/chromium/blob/master/LICENSE)
