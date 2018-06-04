[Gitea](https://code.nephatrine.net/nephatrine/docker-base-alpine) |
[GitHub](https://github.com/nephatrine/docker-base-alpine) |
[DockerHub](https://hub.docker.com/r/nephatrine/base-alpine/) |
[unRAID](https://github.com/nephatrine/unraid-docker-templates)

# Alpine+S6 Base Container

This is not intended to be used directly. It is intended to be used as a base image by other docker containers.

- [Alpine Linux](https://alpinelinux.org/)
- [S6](https://skarnet.org/software/)
- [S6-Overlay](https://github.com/just-containers/s6-overlay)

## Ports

No ports exposed.

## Settings

- **PUID:** Volume Owner UID
- **PGID:** Volume Owner GID
- **TZ:** Time Zone

## Volumes

- **/mnt/config:** Configuration Volume