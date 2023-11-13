all:
	docker compose -f srcs/docker-compose.yml up -d --build
clean:
	docker compose -f srcs/docker-compose.yml down
	docker rmi srcs-mariadb
	docker rmi srcs-wordpress
	docker rmi srcs-nginx
	docker volume rm mariadb_vol
	docker volume rm wordpress_vol
	
# Delete before submitting - only testing purpose
	sudo rm -rf /home/arebelo/data/wordpress/*
	sudo rm -rf /home/arebelo/data/mariadb/*

re: clean all

prune:
	yes | docker system prune -a --volumes

# borrar volumenes en el host