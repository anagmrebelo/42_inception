all:
	docker compose -f srcs/docker-compose.yml up -d
clean:
	docker compose -f srcs/docker-compose.yml down
	docker rmi srcs-mariadb
	docker rmi srcs-wordpress
	docker rmi srcs-nginx
	docker volume rm srcs_mariadb_vol
	docker volume rm srcs_wordpress_vol
	rm -rf ./srcs/requirements/mariadb_vol/*
	rm -rf ./srcs/requirements/nginx/arebelo/*

re: clean all

prune:
	docker system prune -a --volumes -y

# borrar volumenes en el host