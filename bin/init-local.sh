#!/usr/bin/env bash

source bin/shell-helpers.sh
set -e

docker build \
-f provision/docker/storefront/Dockerfile \
-t storefront \
.

docker compose \
build

docker compose \
up \
-d
