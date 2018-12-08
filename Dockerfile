# Experimenting with creating a base Apline/armhf image which includes:
#   * Updates
#   * Base tools
#   * Development tools
#

FROM armhf/alpine
LABEL maintainer "johnbianchi@github.com"

####################
# Toolsets
RUN apk update && apk upgrade && \
  apk add --no-cache --virtual .build-deps \
    alpine-sdk \
    bash \
    git \
    bash-doc \
    bash-completion \
    nano \
    util-linux \
    pciutils \
    usbutils \
    coreutils \
    findutils \
    grep \
    build-base \
    gcc \
    abuild \
    binutils \
    binutils-doc \
    gcc-doc \
    linux-headers \
    eudev-dev \
    man man-pages \
    musl-dev \
    libc-dev \
    build-base \
    ca-certificates \
    supervisor \
    openssl \
    git \
    ffmpeg \
    omxplayer

RUN mkdir /home/piarmy-video-player
COPY containerFiles /home/piarmy-video-player/
COPY play.sh /home/piarmy-video-player/

WORKDIR /home/piarmy-video-player

CMD ["./play.sh"]