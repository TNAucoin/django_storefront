.DEFAULT_GOAL := help

run-fresh-local:
	bash bin/init-local.sh

run-local:
	docker compose up

stop-local:
	docker compose down

kill-local-full:
	docker compose down -v

test:
	docker-compose exec web python manage.py test

help:
	@echo "run-fresh-local	- Initializes local env, builds containers, Refreshes data"
	@echo "run-local	- Starts local with current data (if applicable)"
	@echo "stop-local	- Stops containers"
	@echo "kill-local-full	- Stops containers, deletes volumes"
	@echo "test	- Run tests"

.PHONY:
	run-fresh-local
	run-local
	stop-local
	kill-local-full
	test
	help