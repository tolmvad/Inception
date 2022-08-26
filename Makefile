# ARGS

DIRS	=	/home/bcaffere/data/{db,wp,prt}

# CMD

all:
		@sudo mkdir -p $(DIRS)
		@docker-compose -f srcs/docker-compose.yml up --build -d

up:
		@sudo mkdir -p $(DIRS)
		@docker-compose -f srcs/docker-compose.yml up -d

down:
		@docker-compose -f srcs/docker-compose.yml down

clean:
		@docker-compose -f srcs/docker-compose.yml down
		@docker stop $(docker ps -qa) 2>/dev/null ; \
		docker rm $(docker ps -qa) 2>/dev/null ; \
		docker rmi -f $(docker images -qa) 2>/dev/null ; \
		docker volume rm $(docker volume ls -q) 2>/dev/null ; \
		docker network rm $(docker network ls -q) 2>/dev/null ; \
		docker system prune -a --volume 2>/dev/null ; \
		docker system prune -a --force 2>/dev/null ; \
		sudo rm -rf /home/bcaffere/ 2>/dev/null

info:
		@echo "=============================== IMAGES ==============================="
		@docker images
		@echo
		@echo "============================= CONTAINERS ============================="
		@docker ps -a
		@echo
		@echo "=============== NETWORKS ==============="
		@docker network ls
		@echo
		@echo "====== VOLUMES ======"
		@docker volume ls

.PHONY:	all up down clean info
