FROM ubuntu-unminimized:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN : \
&& apt-get update \
&& apt-get install -y xvfb x11vnc \
&& apt-get install -y xfce4 mousepad \
# ^^ mousepad is a gui text editor
&& apt-get remove -y gnome-screensaver gnome-session-bin gnome-session-common gnome-power-manager \
# ^^ some gnome stuff we don't need
&& apt-get autoremove -y \
#&& rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
# ^^ cleanup disabled for speed
&& :
