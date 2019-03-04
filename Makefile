
UID=$(shell id -u)
XSOCK=/tmp/.X11-unix
DIR=$(shell pwd)

ensure-data-directory-belongs-to-user:
	mkdir -p data/${app}/HOME/
	chown -R ${UID} data/
	chmod -R 755 data/

build-base:
	docker build -t 'j6s/x11-base' --build-arg "UID=${UID}" x11-base/

build: build-base
	docker build -t j6s/${app} --build-arg "UID=${UID}" ${app}

# Runs a container with some basic volume mappings:
# - Mounts sockets & files into container needed for X11 and pulseaudio (not user about devices?)
# - Mounts fake home directory (from data/${app}/HOME)
run: build ensure-data-directory-belongs-to-user
	xhost local:root
	docker run --rm \
		-v ${XSOCK}:${XSOCK} \
		-v /etc/machine-id:/etc/machine-id \
		-v /run/user/${UID}/pulse:/run/user/${UID}/pulse \
		-v /dev/shm:/dev/shm \
		-v ${DIR}/data/${app}/HOME:/home/user \
		--device /dev/snd \
		-e "DISPLAY=${DISPLAY}" \
		--name ${app} \
		'j6s/${app}' \
