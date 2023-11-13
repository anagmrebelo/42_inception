all:
	docker compose -f srcs/docker-compose.yml up -d --build
clean:
	docker compose -f srcs/docker-compose.yml down
	docker rmi mariadb
	docker rmi wordpress
	docker rmi nginx
	docker volume rm srcs_mariadb_vol
	docker volume rm srcs_wordpress_vol
	
fclean: clean
	# Delete before submitting - only testing purpose
	sudo rm -rf /home/arebelo/data/wordpress/*
	sudo rm -rf /home/arebelo/data/mariadb/*

re: clean all

prune:
	yes | docker system prune -a --volumes

# borrar volumenes en el host