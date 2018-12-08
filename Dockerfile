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
  apk add --no-cache --virtual \
    bash \
    bash-doc \
    bash-completion \
    util-linux \
    pciutils \
    usbutils \
    coreutils \  
    findutils \
    supervisor \
    ffmpeg \
    omxplayer

RUN mkdir -v /home/pi
COPY containerFiles /home/pi/
WORKDIR /home/pi

# CMD ["/home/pi/play.sh"]
CMD ["/bin/sh", "-c", "/home/pi/play.sh"]