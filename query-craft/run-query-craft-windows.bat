@echo off
setlocal

REM The script file contains Docker commands to set up the QueryCraft tool. It loads the images, creates and adds the required schemas stored in Docker volumes, and then runs Docker Image.

REM Apart from the Docker export commands in this file, the folder also contains a Docker Compose file. Docker Compose is used to define and manage multi-container Docker applications, specifying how services interact and are configured.

REM Set the current directory to the location of this script.
cd /d "%~dp0"

REM Load Docker images
echo Loading Docker images...

docker load -i postgres.tar
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to load postgres image. Exiting...
    pause
    exit /b %ERRORLEVEL%
)

docker load -i pgadmin4.tar
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to load pgadmin image. Exiting...
    pause
    exit /b %ERRORLEVEL%
)

docker load -i query-craft-web.tar
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to load my-web-app image. Exiting...
    pause
    exit /b %ERRORLEVEL%
)

echo All Docker images loaded successfully!

REM Set the backup directory
set BACKUP_DIR="%cd%\backup"

REM Check if query-craft_postgres_data volume exists, create and restore if not
docker volume inspect query-craft_postgres_data
if %ERRORLEVEL% neq 0 (
    echo Volume query-craft_postgres_data does not exist. Creating and restoring volume...
    docker volume create --name query-craft_postgres_data
    docker run --rm -v query-craft_postgres_data:/volume -v %BACKUP_DIR%:/backup ubuntu sh -c "mkdir -p /backup && tar xvf /backup/postgres_data.tar -C /volume --strip-components=1"
) else (
    echo Volume query-craft_postgres_data already exists...
)

REM Check if query-craft_pgadmin_data volume exists, create and restore if not
docker volume inspect query-craft_pgadmin_data
if %ERRORLEVEL% neq 0 (
    echo Volume query-craft_pgadmin_data does not exist. Creating and restoring volume...
    docker volume create --name query-craft_pgadmin_data
    docker run --rm -v query-craft_pgadmin_data:/volume -v %BACKUP_DIR%:/backup ubuntu sh -c "mkdir -p /backup && tar xvf /backup/pgadmin_data.tar -C /volume --strip-components=1"
) else (
    echo Volume query-craft_pgadmin_data already exists...
)

REM Start the Docker Compose project
echo Starting Docker Compose project...

docker-compose up
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to start Docker Compose project.  Exiting...
    pause
    exit /b %ERRORLEVEL%
)

endlocal
pause
