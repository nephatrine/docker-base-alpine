[GitHub](https://github.com/nephatrine/docker-base-alpine) |
[DockerHub](https://hub.docker.com/r/nephatrine/base-alpine/) |
[unRAID](https://github.com/nephatrine/unraid-docker-templates)

# Alpine Base Docker

This is not intended to be used directly. It is intended to be used as a base image by other dockers.

It is based on [Alpine Linux](https://alpinelinux.org/) alongside [S6](https://skarnet.org/software/) and  [S6-Overlay](https://github.com/just-containers/s6-overlay) to handle all the basics in a lightweight fashion.

Runs logrotate as a cron job even though it is not the "S6 way" of doing things.

## Settings

- **PUID:** Volume Owner UID
- **PGID:** Volume Owner GID

## Mount Points

- **/mnt/config:** Configuration Volume