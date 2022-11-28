#!/usr/bin/env bash

set -e

readonly SEED_FILE="seed.sql"

main () {
    echo_yellow "Seeding DB with data..."
    docker-compose up -d db
    DB_ID=$(docker-compose ps -q db)
    docker cp "provision/docker/storefront/scripts/$SEED_FILE" "$DB_ID:/tmp/$SEED_FILE"
    docker-compose exec -T db bash -c "psql -U postgres -d storefront -f /tmp/$SEED_FILE"
    echo_green "DB Seeded Successfully!"
}

source bin/shell-helpers.sh
main