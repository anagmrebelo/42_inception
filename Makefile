all:
	docker-compose -f srcs/docker-compose.yml up
clean:
	docker stop nginx
	docker stop wordpress
	docker rm nginx
	docker rm wordpress
	docker rmi srcs-nginx
	docker rmi srcs-wordpress
	docker network rm srcs_inception

re: clean all
