FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN : \
&& apt-get update \
&& apt-get install -y curl less lzma nano sudo unzip wget \
## Uncomment next line to install manpages
#&& apt-get install -y man-db && yes | unminimize \
&& rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
&& :

RUN : \
&& apt-get update \
&& apt-get install -y xvfb x11vnc \
&& apt-get install -y xfce4 mousepad \
# ^^ mousepad is a gui text editor
&& apt-get remove -y gnome-screensaver gnome-session-bin gnome-session-common gnome-power-manager \
# ^^ some gnome stuff we don't need
&& apt-get autoremove -y \
&& rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
&& :

RUN : \
&& groupadd -g 2000 user \
&& useradd -m -s /bin/bash -u 2000 -g 2000 user \
&& :

## Uncomment the following to add sudo
#RUN : \
#&& echo "user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/user \
#&& chmod 0440 /etc/sudoers.d/user \
#&& :

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

# Make a desktop shortcut to a text editor; give it a more obvious name than "Mousepad"
RUN mkdir -p /home/user/Desktop
RUN : \
&& cp /usr/share/applications/mousepad.desktop /home/user/Desktop/"Text Editor.desktop" \
&& sed -i -e 's/Name=.*/Name=Text Editor/' /home/user/Desktop/"Text Editor.desktop" \
&& chmod 0755 /home/user/Desktop/"Text Editor.desktop" \
&& :

CMD bash /start.sh
