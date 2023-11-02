include ./srcs/.env
export

all:
	@echo "Creating $(DOMAIN_NAME) in /etc/hosts"
	@sudo chmod 666 $(HOSTS)
	@sudo echo "127.0.0.1 $(DOMAIN_NAME)" >> $(HOSTS)
	@sudo echo "127.0.0.1 www.$(DOMAIN_NAME)" >> $(HOSTS)
	@echo "Building and uping the containers"
	@cd srcs && docker-compose up --build -d

clean:
	@echo "Taking down the containers"
	@cd srcs && docker-compose down

fclean:
	@make clean
	@echo "Removing all the containers, images and volumes"
	@docker system prune -a -f --volumes
	@docker volume prune -f
	@docker network prune -f
	@sudo rm -rf ./srcs/requirements/mariadb/data
	@sudo rm -rf ./srcs/requirements/wordpress/data

re:
	make fclean
	make all

usage:
	@echo "Usage: make [all | clean | fclean | re | usage]"
	@echo "	- all: Builds and ups the containers."
	@echo "	- clean: Takes downs the containers."
	@echo "	- fclean: Cleans and removes all the containers, images and volumes."
	@echo "	- re: Fcleans and rebuilds the containers."

