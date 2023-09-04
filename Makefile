DOCKER_COMPOSE=docker-compose -f ./srcs/docker-compose.yml
SETUP=./srcs/requirements/tools/setup.sh
PURGE=./srcs/requirements/tools/purge.sh

up: setup
	$(DOCKER_COMPOSE) up -d --build


setup:
	chmod +x $(SETUP)
	bash $(SETUP)

down:
	$(DOCKER_COMPOSE) down

build:
	$(DOCKER_COMPOSE) build

ps:
	$(DOCKER_COMPOSE) ps 

logs:
	$(DOCKER_COMPOSE) logs

exec:
	$(DOCKER_COMPOSE) exec $(filter-out $@,$(MAKECMDGOALS)) /bin/sh

fclean:
	chmod +x $(PURGE)
	bash $(PURGE)

