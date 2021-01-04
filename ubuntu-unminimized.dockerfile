FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
#ENV LANG=en_US.UTF-8
#ENV LANGUAGE=en_US.UTF-8
#ENV LC_ALL=en_US.UTF-8
## ^^ perl complains if I don't set all of these
#
#RUN : \
#&& apt-get update \
#&& apt-get install -y locales \
#&& :
#RUN echo LANG=\"$LANG\" > /etc/default/locale

RUN : \
&& apt-get update \
&& apt-get install -y curl less vim wget \
&& apt-get install -y man-db && yes | unminimize \
#&& rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
&& :
