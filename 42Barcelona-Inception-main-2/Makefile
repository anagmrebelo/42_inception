################################################################################
# Colort
################################################################################

DEL_LINE =		\033[2K
ITALIC =		\033[3m
DEF_COLOR =		\033[0;39m
GRAY =			\033[0;90m
RED =			\033[0;91m
DARK_YELLOW =	\033[38;5;143m
BROWN =			\033[38;2;184;143;29m
DARK_GRAY =		\033[38;5;234m
DARK_GREEN =	\033[1m\033[38;2;75;179;82m


WP_HOST_PATH := $(shell grep WP_HOST_PATH srcs/.env | cut -d '=' -f2)
BBDD_HOST_PATH := $(shell grep BBDD_HOST_PATH srcs/.env | cut -d '=' -f2)
BACKUP_HOST_PATH := $(shell grep BACKUP_HOST_PATH srcs/.env | cut -d '=' -f2)



all:
	docker compose -f srcs/docker-compose.yml up -d --build
stop:
	docker compose -f srcs/docker-compose.yml down

cwp:
	-docker stop wordpress
	-docker rm wordpress
	-docker rmi wordpress
	-docker volume rm wp-data

cmdb:
	-docker stop mariadb
	-docker rm mariadb
	-docker rmi mariadb
	-docker volume rm sql-data

cnginx:
	-docker stop ngnix
	-docker rm nginx
	-docker rmi nginx

cadminer:
	-docker stop adminer
	-docker rm adminer
	-docker rmi adminer

clean:
	-docker compose -f srcs/docker-compose.yml down
	@echo "$(DARK_GREEN)NGNIX Docker & Image Clean$(DEF_COLOR)"
	-docker rm nginx
	-docker rmi nginx
	@echo "$(DARK_GREEN)WORDPRESS Docker & Image Clean$(DEF_COLOR)"
	-docker rm wordpress
	-docker rmi wordpress
	@echo "$(DARK_GREEN)MARIADB Docker & Image Clean$(DEF_COLOR)"
	-docker rm mariadb	
	-docker rmi mariadb
	@echo "$(DARK_GREEN)ADMINER Docker & Image Clean$(DEF_COLOR)"
	-docker rm adminer	
	-docker rmi adminer
	@echo "$(DARK_GREEN)FTP Docker & Image Clean$(DEF_COLOR)"
	-docker rm ftp
	-docker rmi ftp
	@echo "$(DARK_GREEN)FTP Docker & Image Clean$(DEF_COLOR)"
	-docker rm backup
	-docker rmi backup
	@echo "$(DARK_GREEN)STATIC WEB Docker & Image Clean$(DEF_COLOR)"
	-docker rm staticweb
	-docker rmi staticweb
	@echo "$(DARK_GREEN)VOLUMES Clean$(DEF_COLOR)"
	-docker volume rm wp-data
	-docker volume rm sql-data
	-docker volume rm backup-data
	rm -rf ${WP_HOST_PATH}
	mkdir -p ${WP_HOST_PATH}
	chmod 777 ${WP_HOST_PATH}
	rm -rf ${BBDD_HOST_PATH}
	mkdir -p ${BBDD_HOST_PATH}
	chmod 777 ${BBDD_HOST_PATH}
	rm -rf ${BACKUP_HOST_PATH}
	mkdir -p ${BACKUP_HOST_PATH}
	chmod 777 ${BACKUP_HOST_PATH}
	@echo "$(DARK_GREEN)NETWORK Docker & Image Clean$(DEF_COLOR)"
	-docker network rm inception

prune:
	yes | docker system prune -a --volumes

re: clean all