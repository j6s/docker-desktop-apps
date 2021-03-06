# Docker desktop applications
This repository aims to start nonfree linux applications inside of a docker container in order to encapsulate the nonfree dependencies and guard the host system.

Applications in this repository are the ones that I personally would like to use, but feel pretty uncomfortable with having their sources.

## Usage

To start an application use `make run app=APP_NAME` (APP_NAME being the name of folder containing the dockerfile).

## Questions you might be asking
### Why build this when the excellent repository of [Jessie Frazelle](https://blog.jessfraz.com/post/docker-containers-on-the-desktop/) exists?
There are 2 main reasons for this:
1. Jessie Frazelle's images don't handle sound via pulseaudio
2. I just wanted to experiment with what's possible with containers.

### Why are firefox, chromium & audacity in here if the goal is to encapsulate non-free software
Those were my first steps into desktop applications inside of containers

### Why is google chrome started with `--no-sandbox`
I am currently investigating how to properly start chrome.
Using `--no-sandbox` is not a good solution.

### Running an editor this way makes no sense
You are right, running an editor using `make run` makes no sense - Let `make build app=APP_NAME`
build the image and launch the editor using the following command:

```bash
$ docker run --rm \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v $(pwd):/current \
	-e "DISPLAY=$DISPLAY" \
	j6s/vscode \
	code --wait /current
```

This will mount the current directory as `/current`.
PHPStorm works in a similar fashion.
