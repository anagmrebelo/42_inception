#//////////////////////////////////////////////////////////////////////#
#	_Makefile                                                          #
#//////////////////////////////////////////////////////////////////////#

all:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

clean:
	@rm -rf /home/smiro/data/mysql/*
	@rm -rf /home/smiro/data/wordpress/*
	@docker stop $$(docker ps -qa)
	@docker rm $$(docker ps -qa)
	@docker rmi $$(docker images -qa)
	@docker volume rm $$(docker volume ls -q)
	@docker network rm smironet

.PHONY: all down clean
