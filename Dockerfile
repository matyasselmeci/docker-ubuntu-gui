FROM ubuntu:focal

RUN : \
&& apt-get update \
&& apt-get install xvfb fluxbox openssh-server x11vnc \
&& rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
&& :
COPY start.sh /start.sh
