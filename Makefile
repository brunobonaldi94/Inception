DOCKER_COMPOSE=./srcs/docker-compose.yml

up: 
	docker-compose -f $(DOCKER_COMPOSE) up -d

down:
	docker-compose -f $(DOCKER_COMPOSE) down

build:
	docker-compose -f $(DOCKER_COMPOSE) build

ps:
	docker-compose -f $(DOCKER_COMPOSE) ps 

fclean:
	docker container rm -f $(shell docker container ps -qa)
	docker image rmi -f $(shell docker image ls -qa) 

