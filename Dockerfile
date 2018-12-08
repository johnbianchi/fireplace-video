#
#FROM alpine
FROM resin/rpi-raspbian

LABEL maintainer "johnbianchi@github.com"

# RUN apt-get update -y \
#  && apt-get -y install \
#     wget 
#     ca-certificates \
#     libpcre3 \
#     libfreetype6 \
#     fonts-freefont-ttf \
#     dbus \
#     libssl1.0.0 \
#     libsmbclient \
#     libssh-4 \
#     fbset \
#     libraspberrypi0 \
#  && apt-get clean
#  && wget https://archive.raspberrypi.org/debian/pool/main/o/omxplayer/omxplayer_0.3.6~git20160102~f544084_armhf.deb \
#  && dpkg -i omxplayer_0.3.6~git20160102~f544084_armhf.deb

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        curl \
        dbus \
        fbset \
        fonts-freefont-ttf \
        libasound2 \
        libfreetype6 \
        libpcre3 \
        libraspberrypi0 \
        libsmbclient \
        libssh-4 \
        wget \
    && apt-get clean

#RUN wget http://omxplayer.sconde.net/builds/omxplayer_0.3.6~git20150912~d99bd86_armhf.deb -O /tmp/omxplayer.deb
#RUN wget https://omxplayer.sconde.net/builds/omxplayer_0.3.7~git20170130~62fb580_armhf.deb -O /tmp/omxplayer.deb
RUN wget https://archive.raspberrypi.org/debian/pool/main/o/omxplayer/omxplayer_0.3.6~git20160102~f544084_armhf.deb -O /tmp/omxplayer.deb
RUN dpkg -i /tmp/omxplayer.deb

# play it
RUN mkdir -v /home/pi
COPY containerFiles /home/pi/
WORKDIR /home/pi

# CMD ["/home/pi/play.sh"]
CMD ["/bin/bash", "-c", "/home/pi/play.sh"]