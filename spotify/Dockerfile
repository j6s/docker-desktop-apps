FROM j6s/x11-base

RUN apt-get update && apt-get install -y gpg
RUN apt-key adv \
		--keyserver hkp://keyserver.ubuntu.com:80 \
		--recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90 && \
	echo 'deb http://repository.spotify.com stable non-free' > /etc/apt/sources.list.d/spotify.list && \
	apt-get update &&\
	apt-get install -y -q --no-install-recommends spotify-client

USER user
CMD spotify
