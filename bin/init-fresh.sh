#!/usr/bin/env bash

source bin/shell-helpers.sh
set -e

docker build \
-f provision/docker/storefront/Dockerfile \
-t storefront \
.

bash bin/refresh-local-db.sh

docker compose \
build
docker compose up -d web
docker compose exec -T web bash -c "python manage.py makemigrations && python manage.py migrate --noinput"

bash bin/seed-db-tables.sh
