FROM alpine:3.8
LABEL maintainer="Daniel Wolf <nephatrine@gmail.com>"

ENV \
 HOME="/root" \
 PS1="$(whoami)@$(hostname):$(pwd)$ " \
 S6_BEHAVIOUR_IF_STAGE2_FAILS=1 \
 S6_KILL_FINISH_MAXTIME=18000

RUN echo "====== INSTALL PACKAGES ======" \
 && apk --update upgrade \
 && apk add bash ca-certificates coreutils file libressl logrotate shadow tzdata \
 \
 && echo "====== CONFIGURE SYSTEM ======" \
 && mkdir -p /mnt/config \
 && rm /etc/logrotate.d/acpid \
 && useradd -u 1000 -U -d /mnt/config/home -s /sbin/nologin guardian \
 && usermod -g users guardian \
 \
 && echo "====== INSTALL BUILD TOOLS ======" \
 && apk add --virtual .build-s6 build-base git libressl-dev linux-headers \
 && mkdir -p /usr/src \
 \
 && echo "====== COMPILE SKALIBS ======" \
 && cd /usr/src \
 && git clone https://github.com/skarnet/skalibs.git \
 && cd skalibs \
 && ./configure --enable-clock --enable-monotonic \
 && make -j4 strip \
 && make install \
 \
 && echo "====== COMPILE EXECLINE ======" \
 && cd /usr/src \
 && git clone https://github.com/skarnet/execline.git \
 && cd execline \
 && ./configure \
 && make -j4 strip \
 && make install \
 \
 && echo "====== COMPILE S6 ======" \
 && cd /usr/src \
 && git clone https://github.com/skarnet/s6.git \
 && cd s6 \
 && ./configure \
 && make -j4 strip \
 && make install \
 \
 && echo "====== COMPILE S6-PORTABLE-UTILS ======" \
 && cd /usr/src \
 && git clone https://github.com/skarnet/s6-portable-utils.git \
 && cd s6-portable-utils \
 && ./configure \
 && make -j4 strip \
 && make install \
 \
 && echo "====== COMPILE S6-LINUX-UTILS ======" \
 && cd /usr/src \
 && git clone https://github.com/skarnet/s6-linux-utils.git \
 && cd s6-linux-utils \
 && ./configure \
 && make -j4 strip \
 && make install \
 \
 && echo "====== COMPILE S6-DNS ======" \
 && cd /usr/src \
 && git clone https://github.com/skarnet/s6-dns.git \
 && cd s6-dns \
 && ./configure \
 && make -j4 strip \
 && make install \
 \
 && echo "====== COMPILE S6-NETWORKING ======" \
 && cd /usr/src \
 && git clone https://github.com/skarnet/s6-networking.git \
 && cd s6-networking \
 && ./configure --enable-ssl=libressl \
 && make -j4 strip \
 && make install \
 \
 && echo "====== COMPILE S6-RC ======" \
 && cd /usr/src \
 && git clone https://github.com/skarnet/s6-rc.git \
 && cd s6-rc \
 && ./configure \
 && make -j4 strip \
 && make install \
 \
 && echo "====== INSTALL S6-OVERLAY ======" \
 && cd /usr/src \
 && git clone https://github.com/just-containers/s6-overlay.git \
 && cd s6-overlay/builder \
 && egrep 'mkdir -p \$overlaydstpath/|chmod [0-9]+ \$overlaydstpath' build-latest | sed 's/$overlaydstpath/overlay-rootfs/g' > build-here \
 && bash build-here \
 && cd overlay-rootfs \
 && cp -Rai ./* / \
 \
 && echo "====== CLEANUP ======" \
 && cd /usr/src \
 && apk del --purge .build-s6 \
 && rm -rf /tmp/* /usr/src/* /var/cache/apk/* \
  /usr/include/execline /usr/lib/execline \
  /usr/include/s6 /usr/lib/s6 \
  /usr/include/s6-dns /usr/lib/s6-dns \
  /usr/include/s6-linux-utils \
  /usr/include/s6-networking /usr/lib/s6-networking \
  /usr/include/s6-portable-utils \
  /usr/include/s6-rc /usr/lib/s6-rc \
  /usr/include/skalibs /usr/lib/skalibs

COPY override /
ENTRYPOINT ["/init"]
