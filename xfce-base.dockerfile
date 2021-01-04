FROM ubuntu-unminimized:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN : \
&& apt-get update \
&& apt-get install -y xvfb x11vnc \
&& apt-get install -y xfce4 \
&& :
