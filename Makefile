all:
	docker compose -f srcs/docker-compose.yml up
clean:
	docker compose -f srcs/docker-compose.yml down
	docker rmi srcs-mariadb
	docker volume rm srcs_mariadb_vol
	docker volume rm srcs_wordpress_vol
	rm -rf ./requirements/mariadb_vol
	mkdir ./requirements/mariadb_vol

images:
	docker rmi srcs-wordpress
	docker rmi srcs-nginx

re: clean all

# borrar volumenes en el host