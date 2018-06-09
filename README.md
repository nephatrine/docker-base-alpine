[Git Repo](https://code.nephatrine.net/nephatrine/docker-base-alpine) |
[DockerHub](https://hub.docker.com/r/nephatrine/base-alpine/) |
[unRAID Template](https://github.com/nephatrine/unraid-docker-templates)

# Alpine+S6 Base Container

This is not intended to be used directly. It is intended to be used as a base image by other docker containers.

- [Alpine Linux](https://alpinelinux.org/)
- [S6](https://skarnet.org/software/)
- [S6-Overlay](https://github.com/just-containers/s6-overlay)

## Configuration

- ``{config}/etc/crontab``: Crontab Entries
- ``{config}/etc/logrotate.conf``: Logrotate General Configuration
- ``{config}/etc/logrotate.d/*``: Logrotate Application Configuration

## Ports

No ports exposed.

## Variables

- **PUID:** Volume Owner UID
- **PGID:** Volume Owner GID
- **TZ:** Time Zone

## Volumes

- **/mnt/config:** Configuration/Logs
