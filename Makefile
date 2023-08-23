DOCKER_COMPOSE=./srcs/docker-compose.yml
LOGIN_SETUP=./srcs/requirements/tools/get_base_dir.sh
SETUP=./srcs/requirements/tools/setup.sh
PURGE=./srcs/requirements/tools/purge.sh

up: setup
	chmod +x $(SETUP)
	sh $(SETUP)
	docker-compose -f $(DOCKER_COMPOSE) up -d

setup:
	chmod +x $(LOGIN_SETUP)
	sh $(LOGIN_SETUP)

down:
	docker-compose -f $(DOCKER_COMPOSE) down

build:
	docker-compose -f $(DOCKER_COMPOSE) build

ps:
	docker-compose -f $(DOCKER_COMPOSE) ps 

logs:
	docker-compose -f $(DOCKER_COMPOSE) logs

fclean:
	chmod +x $(PURGE)
	sh $(PURGE)

