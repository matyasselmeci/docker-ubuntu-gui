FROM ubuntu-gui-fluxbox-base:latest

RUN : \
&& groupadd -g 2000 user \
&& useradd -m -s /bin/bash -u 2000 -g 2000 user \
# XXX I might turn off sudo once I'm done experimenting
&& echo "user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/user \
&& chmod 0440 /etc/sudoers.d/user \
&& :

COPY start-fluxbox.sh /start.sh

USER user
WORKDIR /home/user

CMD /start.sh
