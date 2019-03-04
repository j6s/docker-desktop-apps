FROM j6s/x11-base

RUN apt-get -y update && apt-get -y install wget git
RUN wget -q -O /phpstorm.tar.gz https://download.jetbrains.com/webide/PhpStorm-2018.3.4.tar.gz && \
	tar -xzf /phpstorm.tar.gz && \
	mv /PhpStorm* /phpstorm

USER user
CMD /phpstorm/bin/phpstorm.sh
