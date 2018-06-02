[GitHub](https://github.com/nephatrine/docker-base-alpine) |
[DockerHub](https://hub.docker.com/r/nephatrine/base-alpine/) |
[unRAID](https://github.com/nephatrine/unraid-docker-templates)

# Alpine+S6 Base Docker

This is not intended to be used directly. It is intended to be used as a base image by other dockers.

It is based on [Alpine Linux](https://alpinelinux.org/) alongside [S6](https://skarnet.org/software/) and [S6-Overlay](https://github.com/just-containers/s6-overlay) to handle all the basics in a lightweight fashion.

## Settings

- **PUID:** Volume Owner UID
- **PGID:** Volume Owner GID
- **TZ:** Time Zone

## Mount Points

- **/mnt/config:** Configuration Volume