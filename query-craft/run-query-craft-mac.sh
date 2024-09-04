#!/bin/bash

set -e

# The script file contains Docker commands to set up the QueryCraft tool. It loads the images, creates and adds the required schemas stored in Docker volumes, and then runs Docker Image.

# Apart from the Docker export commands in this file, the folder also contains a Docker Compose file. Docker Compose is used to define and manage multi-container Docker applications, specifying how services interact and are configured.

# Set the current directory to the location of this script.
cd "$(dirname "$0")"

# Load Docker images
echo "Loading Docker images..."

docker load -i postgres.tar
if [ $? -ne 0 ]; then
    echo "Error: Failed to load postgres image. Exiting..."
    exit 1
fi

docker load -i pgadmin4.tar
if [ $? -ne 0 ]; then
    echo "Error: Failed to load pgadmin image. Exiting..."
    exit 1
fi

docker load -i query-craft-web.tar
if [ $? -ne 0 ]; then
    echo "Error: Failed to load my-web-app image. Exiting..."
    exit 1
fi

echo "All Docker images loaded successfully!"

# Set the backup directory
BACKUP_DIR="$(pwd)/backup"

# Create and restore Docker volumes
#Check if query-craft_postgres_data volume exists, create and restore if not

if ! docker volume inspect query-craft_postgres_data > /dev/null 2>&1
then
    echo "Volume query-craft_postgres_data does not exist. Creating and restoring volume..."
    docker run --rm -v query-craft_postgres_data:/volume -v "$BACKUP_DIR":/backup ubuntu sh -c "mkdir -p /backup && tar xvf /backup/postgres_data.tar -C /volume --strip-components=1 && chown -R 999:999 /volume" > /dev/null 2>&1
else
    echo Volume query-craft_postgres_data already exists...
fi

#Check if query-craft_pgadmin_data volume exists, create and restore if not
if ! docker volume inspect query-craft_pgadmin_data > /dev/null 2>&1 
then
    echo "Volume query-craft_pgadmin_data does not exist. Creating and restoring volume..."
    docker run --rm -v query-craft_pgadmin_data:/volume -v "$BACKUP_DIR":/backup ubuntu sh -c "mkdir -p /backup && tar xvf /backup/pgadmin_data.tar -C /volume --strip-components=1 && chown -R 5050:5050 /volume" > /dev/null 2>&1
else
    echo Volume query-craft_pgadmin_data already exists...
fi

# Start the Docker Compose project
echo "Starting Docker Compose project..."

docker-compose up
if [ $? -ne 0 ]; then
    echo "Error: Failed to start Docker Compose project. Exiting..."
    exit 1
fi

echo "Docker Compose project started successfully!"
