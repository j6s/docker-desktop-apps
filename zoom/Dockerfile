FROM j6s/x11-base

RUN apt-get update && \
	apt-get install -y wget libxcb-randr0 libxcb-image0 libxslt1.1 \
		libsqlite3-0 libxcb-keysyms1 libxcb-xtest0 ibus libnss3

RUN wget -O /zoom.deb https://zoom.us/client/latest/zoom_amd64.deb && \
	dpkg -i /zoom.deb && \
	rm /zoom.deb

USER user
CMD zoom
