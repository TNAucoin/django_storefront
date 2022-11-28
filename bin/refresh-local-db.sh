#!/usr/bin/env bash

set -e

readonly TRUNCATE_TABLE_SCRIPT="truncate-db-table.sql"
readonly STORE_CUSTOMER_SQL="store_customer.sql"
DB_USER="postgres"
DB_PASS="postgres"
DB_NAME="storefront"

main() {
    echo_yellow "Run DB..."
    docker-compose up -d db
    echo_yellow "🔎 Getting ID of DB container..."
    DB_ID=$(docker-compose ps -q db)
    echo_blue "DB Container ID $DB_ID"
    echo_yellow "🧨 Removing existing database..."
    docker cp "provision/docker/storefront/scripts/$TRUNCATE_TABLE_SCRIPT" "$DB_ID:/tmp/$TRUNCATE_TABLE_SCRIPT"
    docker-compose exec -T db bash -c "psql -U postgres --set 'DB_USER=$DB_USER' --set 'DB_NAME=$DB_NAME' --set 'DB_PASS=$DB_PASS' -f /tmp/$TRUNCATE_TABLE_SCRIPT"
    docker-compose exec -T db bash -c "rm /tmp/$TRUNCATE_TABLE_SCRIPT"

    echo_green "🚀 Database refreshed successfully!"


}

source bin/shell-helpers.sh
main