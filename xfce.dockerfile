FROM arcgis-xfce-base:latest

RUN : \
&& groupadd -g 2000 user \
&& useradd -m -s /bin/bash -u 2000 -g 2000 user \
# XXX I might turn off sudo once I'm done experimenting
&& apt-get update \
&& apt-get install -y sudo \
&& echo "user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/user \
&& chmod 0440 /etc/sudoers.d/user \
&& :

USER user
WORKDIR /home/user

COPY start-xfce.sh /start.sh

CMD bash /start.sh
