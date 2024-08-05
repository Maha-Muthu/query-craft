#!/bin/bash

set -e

# The script file contains Docker commands to export the QueryCraft tool. It saves the images and exports the schemas from the Docker volumes into the backup folder.

# Apart from the Docker export commands in this file, the folder also contains a Docker Compose file. Docker Compose is used to define and manage multi-container Docker applications, specifying how services interact and are configured.

# Set the current directory to the location of this script.
cd "$(dirname "$0")"

# Create the export and backup directories.
EXPORT_DIR="$(pwd)/query-craft"
BACKUP_DIR="$EXPORT_DIR/backup"

echo "Creating query-craft and backup folders..."
if [ ! -d "$EXPORT_DIR" ]; then
    mkdir "$EXPORT_DIR"
fi

if [ ! -d "$BACKUP_DIR" ]; then
    mkdir "$BACKUP_DIR"
fi

echo "Saving Docker images..."

docker save -o "$EXPORT_DIR/postgres.tar" postgres
if [ $? -ne 0 ]; then
    echo "Error: Failed to save postgres image. Exiting..."
    exit 1
fi

docker save -o "$EXPORT_DIR/pgadmin4.tar" dpage/pgadmin4
if [ $? -ne 0 ]; then
    echo "Error: Failed to save pgadmin. Exiting..."
    exit 1
fi

docker save -o "$EXPORT_DIR/query-craft-web.tar" query-craft-web
if [ $? -ne 0 ]; then
    echo "Error: Failed to save query-craft-web image. Exiting..."
    exit 1
fi

echo "All Docker images saved successfully!"

# Export Docker volumes
echo "Exporting Docker volumes..."
docker run --rm -v query-craft_postgres_data:/volume -v "$BACKUP_DIR":/backup ubuntu sh -c "mkdir -p /backup && tar cvf /backup/postgres_data.tar /volume"
if [ $? -ne 0 ]; then
    echo "Error: Failed to backup volume query-craft_postgres_data. Exiting..."
    exit 1
fi

docker run --rm -v query-craft_pgadmin_data:/volume -v "$BACKUP_DIR":/backup ubuntu sh -c "mkdir -p /backup && tar cvf /backup/pgadmin_data.tar /volume"
if [ $? -ne 0 ]; then
    echo "Error: Failed to backup volume query-craft_pgadmin_data. Exiting..."
    exit 1
fi

echo "All Docker Volumes exported successfully!"

echo "All tasks completed successfully!"
