FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN : \
&& apt-get update \
&& apt-get install -y curl less sudo vim wget \
&& apt-get install -y man-db && yes | unminimize \
#&& rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
# ^^ cleanup disabled for speed
&& :
