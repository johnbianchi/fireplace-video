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

MKDIR /home/pi
COPY containerFiles /home/pi/
COPY play.sh /home/pi/

# CMD ["/bin/sh", "-c", "/home/pi/play.sh"]
CMD ["/home/pi/play.sh"]