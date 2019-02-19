FROM debian
ARG UID

RUN apt-get update && apt-get install -y xorg numix-gtk-theme pulseaudio libgl1-mesa-dri libgl1-mesa-glx sudo

ENV HOME /home/user
RUN echo $UID
RUN useradd -u $UID --create-home --home-dir /home/user user && \
	usermod -a -G audio user && \
	chown -R user:user /home/user && \
	echo 'ALL            ALL = (ALL) NOPASSWD: ALL' > /etc/sudoers

ENV GTK2_RC_FILES /usr/share/themes/Numix/gtk-2.0/gtkrc
ENV GTK_THEME Numix

