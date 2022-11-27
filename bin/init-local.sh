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

docker compose \
up