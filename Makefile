help:
	@cat Makefile

GPU?=0
DOCKER_FILE=Dockerfile
NAME=$(shell dirname `pwd` | xargs basename)
SRC?=$(shell dirname `pwd`)
DATA?=/mnt/gaia/data

build:
	docker build -t $(NAME) -f $(DOCKER_FILE) .

lab: build
	docker run --gpus '"device=$(GPU)"' -it -v $(SRC):/lab -v $(DATA):/lab/data --net=host $(NAME) /bin/zsh
