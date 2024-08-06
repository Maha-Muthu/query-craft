#!/bin/bash

set -e

# The script file contains Docker commands to set up the QueryCraft tool. It loads the images, creates and adds the required schemas stored in Docker volumes, and then runs Docker Image.

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

# Create and restore Docker volumes
echo "Creating and restoring Docker Volumes..."

docker volume create --name query-craft_postgres_data
if [ $? -ne 0 ]; then
    echo "Error: Failed to create volume query-craft_postgres_data. Exiting..."
    exit 1
fi

docker volume create --name query-craft_pgadmin_data
if [ $? -ne 0 ]; then
    echo "Error: Failed to create volume query-craft_pgadmin_data. Exiting..."
    exit 1
fi

echo "All Docker Volumes created successfully!"

# Set the backup directory
BACKUP_DIR="$(pwd)/backup"

# Restore the volumes
echo "Restoring the postgres_data volume..."

docker run --rm -v query-craft_postgres_data:/volume -v "$BACKUP_DIR":/backup ubuntu sh -c "mkdir -p /backup && tar xvf /backup/postgres_data.tar -C /volume --strip-components=1"
if [ $? -ne 0 ]; then
    echo "Failed to restore the postgres_data volume. Exiting..."
    exit 1
fi

echo "Restoring the pgadmin_data volume..."
docker run --rm -v query-craft_pgadmin_data:/volume -v "$BACKUP_DIR":/backup ubuntu sh -c "mkdir -p /backup && tar xvf /backup/pgadmin_data.tar -C /volume --strip-components=1"
if [ $? -ne 0 ]; then
    echo "Failed to restore the pgadmin_data volume. Exiting..."
    exit 1
fi

# Start the Docker Compose project
echo "Starting Docker Compose project..."

docker-compose up
if [ $? -ne 0 ]; then
    echo "Error: Failed to start Docker Compose project. Exiting..."
    exit 1
fi

echo "Docker Compose project started successfully!"
