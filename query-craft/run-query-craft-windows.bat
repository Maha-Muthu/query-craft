@echo off
setlocal

REM The script file contains Docker commands to set up the QueryCraft tool. It loads the images, creates and adds the required schemas stored in Docker volumes, and then runs Docker Image.

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

echo All Docker images loaded successfully !

REM Create and restore Docker volumes
echo Creating and restoring Docker Volumes...

docker volume create --name query-craft_postgres_data_c
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to create volume query-craft_postgres_data. Exiting...
    pause
    exit /b %ERRORLEVEL%
)

docker volume create --name query-craft_pgadmin_data_c
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to create volume query-craft_pgadmin_data. Exiting...
    pause
    exit /b %ERRORLEVEL%
)

echo All Docker Volumes created successfully !

REM Set the backup directory
set BACKUP_DIR="%cd%\backup"

REM Restore the volumes
echo Restoring the postgres_data volume...

docker run --rm -v query-craft_postgres_data_c:/volume -v %BACKUP_DIR%:/backup ubuntu sh -c "mkdir -p /backup && tar xvf /backup/postgres_data.tar -C /volume --strip-components=1"
if errorlevel 1 (
    echo Failed to restore the postgres_data volume. Exiting...
    pause
    exit /b 1
)


echo Restoring the pgadmin_data volume...
docker run --rm -v query-craft_pgadmin_data_c:/volume -v %BACKUP_DIR%:/backup ubuntu sh -c "mkdir -p /backup && tar xvf /backup/pgadmin_data.tar -C /volume --strip-components=1"
if errorlevel 1 (
    echo Failed to restore the pgadmin_data volume. Exiting...
    pause
    exit /b 1
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
