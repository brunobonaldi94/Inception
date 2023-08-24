DOCKER_COMPOSE=./srcs/docker-compose.yml
LOGIN_SETUP=./srcs/requirements/tools/get_base_dir.sh
SETUP=./srcs/requirements/tools/setup.sh
PURGE=./srcs/requirements/tools/purge.sh

up: setup
	docker-compose -f $(DOCKER_COMPOSE) up -d --build

setup:
	chmod +x $(LOGIN_SETUP)
	bash $(LOGIN_SETUP)
	chmod +x $(SETUP)
	bash $(SETUP)

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
	bash $(PURGE)

