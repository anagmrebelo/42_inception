all:
	docker-compose -f srcs/docker-compose.yml up
clean:
	docker stop nginx
	docker stop wordpress
	docker rm nginx
	docker rm wordpress
	docker rmi srcs_nginx
	docker rmi srcs_wordpress
	docker network rm srcs_inception
	docker volume rm srcs_wordpress_vol

re: clean all
