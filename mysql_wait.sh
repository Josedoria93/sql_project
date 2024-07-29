#!/bin/bash

# Source the .env file
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo ".env file not found"
    exit 1
fi

# Wait until MySQL is ready
until docker exec -it mysql mysql -u"$MYSQL_USER" -p"$MYSQL_ROOT_PASSWORD" -e "\q"
do
    echo "Waiting for MySQL to be ready..."
    sleep 2
done

echo "MySQL is ready."