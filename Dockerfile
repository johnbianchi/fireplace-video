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
    coreutils \ github JMH  
    findutils \
    supervisor \
    ffmpeg \
    omxplayer

COPY containerFiles /
COPY play.sh /

#CMD ["/play.sh"]
CMD ["/bin/sh", "-c", "/play.sh"]