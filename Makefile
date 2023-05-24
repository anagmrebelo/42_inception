all:
	docker-compose -f srcs/docker-compose.yml up -d
clean:
	docker-compose -f srcs/docker-compose.yml down
	docker rmi srcs-mariadb
	rm -rf requirements/mariadb_vol/*

images:
	docker rmi srcs-wordpress
	docker rmi srcs-nginx

re: clean all

# borrar volumenes en el host