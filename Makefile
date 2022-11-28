.DEFAULT_GOAL := help

rebuild-local:
	bash bin/init-local.sh

init-local:
	bash bin/init-fresh.sh

run:
	docker compose up

stop:
	docker compose down

kill-local:
	docker compose down -v

test:
	docker-compose exec web python manage.py test

help:
	@echo "rebuild-local	- Rebuilds the containers, and runs"
	@echo "init-local	- Initializes local env, builds containers, Refreshes data"
	@echo "run	- Starts local with current data (if applicable)"
	@echo "stop	- Stops containers"
	@echo "kill-local	- Stops containers, deletes volumes"
	@echo "test	- Run tests"

.PHONY:
	rebuild-local
	init-local
	run
	stop
	kill-local
	test
	help