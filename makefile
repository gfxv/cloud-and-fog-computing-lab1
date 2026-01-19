SCALE=5
APP_NAME=lab1

up:
	docker compose up --build -d

down:
	docker compose down -v 
	docker stack rm $(APP_NAME)

deploy:
	docker compose build app
	docker stack deploy -c docker-compose.yml $(APP_NAME)
	@make status

scale:
	docker service scale lab1_app=$(SCALE)
	@make status

status:
	docker stack ps $(APP_NAME)
	docker stack services $(APP_NAME)