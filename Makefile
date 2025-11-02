SHELL := /bin/bash
# check if 'podman-compose' commmand not found
ifeq ($(shell which podman-compose 2>/dev/null),)
# check if 'docker-compose' commmand not found
ifeq ($(shell which docker-compose 2>/dev/null),)
runner := docker compose
else
# if 'docker-compose' commnand found
runner := docker-compose
endif
else
# if 'podman-compose' commnand found
runner := podman-compose
endif

default:
	@echo "Runner: $(runner)"
	@$(runner) --version

up:
	$(runner) -f ./docker/docker-compose.yml up -d

down:
	$(runner) -f ./docker/docker-compose.yml down
