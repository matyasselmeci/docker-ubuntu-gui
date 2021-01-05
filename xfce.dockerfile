FROM ubuntu-gui-xfce-base:latest

RUN : \
&& groupadd -g 2000 user \
&& useradd -m -s /bin/bash -u 2000 -g 2000 user \
# XXX I might turn off sudo once I'm done experimenting
&& echo "user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/user \
&& chmod 0440 /etc/sudoers.d/user \
&& :

COPY start-xfce.sh /start.sh
COPY xfce4-config.tar /tmp/xfce4-config.tar

RUN : \
&& cd /home/user \
&& tar xf /tmp/xfce4-config.tar \
&& chown -R user:user .config \
&& rm -f /tmp/xfce4-config.tar \
&& :

USER user
WORKDIR /home/user

CMD bash /start.sh
