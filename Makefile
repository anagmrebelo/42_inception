all:
	docker compose -f srcs/docker-compose.yml up -d --build
clean:
	docker compose -f srcs/docker-compose.yml down
	docker rmi -f $$(docker images -qa) 
	docker volume rm $$(docker volume ls -q) 

fclean: clean prune
	sudo rm -rf /home/arebelo/data/wordpress/*
	sudo rm -rf /home/arebelo/data/mariadb/*

re: clean all

prune:
	yes | docker system prune -a --volumes
