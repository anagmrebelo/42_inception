all:
	docker compose -f srcs/docker-compose.yml up -d --build
clean:
	docker compose -f srcs/docker-compose.yml down
	docker rmi srcs-mariadb
	docker rmi srcs-wordpress
	docker rmi srcs-nginx
	docker volume rm srcs_mariadb_vol
	docker volume rm srcs_wordpress_vol
	
# Delete before submitting - only testing purpose
	sudo rm -rf ./srcs/requirements/mariadb_vol/*
	sudo rm -rf ./srcs/requirements/nginx/arebelo/*

re: clean all

prune:
	yes | docker system prune -a --volumes

# borrar volumenes en el host