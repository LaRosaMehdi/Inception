include ./srcs/.env
export

all:
	@echo "Creating $(DOMAIN_NAME) in /etc/hosts"
	@sudo chmod 666 $(HOSTS)
	@sudo echo "127.0.0.1 $(DOMAIN_NAME)" >> $(HOSTS)
	@sudo echo "127.0.0.1 www.$(DOMAIN_NAME)" >> $(HOSTS)
	@echo "Building and uping the containers"
	@mkdir -p $(ABSOLUTE_PATH)$(MDB_VOLUME_PATH) $(WP_VOLUME_PATH)
	@chmod 777 $(ABSOLUTE_PATH)$(MDB_VOLUME_PATH) $(WP_VOLUME_PATH)
	@cd srcs && docker-compose up --build -d

clean:
	@echo "Taking down the containers"
	@cd srcs && docker-compose down

fclean:
	@make clean
	@echo "Removing all the containers, images and volumes"
	@docker system prune -a -f --volumes
	@docker network prune -f
	@docker volume rm $$(docker volume ls -qf dangling=true) 2>/dev/null || true
	@rm -rf $(ABSOLUTE_PATH)$(MDB_VOLUME_PATH) $(WP_VOLUME_PATH)

re:
	make fclean
	make all

usage:
	@echo "Usage: make [all | clean | fclean | re | usage]"
	@echo "	- all: Builds and ups the containers."
	@echo "	- clean: Takes downs the containers."
	@echo "	- fclean: Cleans and removes all the containers, images and volumes."
	@echo "	- re: Fcleans and rebuilds the containers."

