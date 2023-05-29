all:
	docker compose -f srcs/docker-compose.yml up
clean:
	docker compose -f srcs/docker-compose.yml down
	docker rmi srcs-mariadb
	docker rmi srcs-wordpress
	docker rmi srcs-nginx
	docker volume rm srcs_mariadb_vol
	docker volume rm srcs_wordpress_vol
	sudo rm -rf ./srcs/requirements/mariadb_vol/*

re: clean all

# borrar volumenes en el host