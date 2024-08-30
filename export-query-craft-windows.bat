@echo off
setlocal

REM The script file contains Docker commands to export the QueryCraft tool. It saves the images and exports the schemas from the Docker volumes into the backup folder.

REM Set the current directory to the location of this script.
cd /d "%~dp0"

REM Create the export and backup directories.
set EXPORT_DIR="%cd%\query-craft"
set BACKUP_DIR="%EXPORT_DIR%\backup"

echo Creating query-craft and backup folders...
if not exist "%EXPORT_DIR%" mkdir "%EXPORT_DIR%"
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%"
if %ERRORLEVEL% neq 0 (
    echo Error: Failed while creating query-craft and backup folders postgres image. Exiting...
    pause
    exit /b %ERRORLEVEL%
)

REM Save Docker images
echo Saving Docker images...

docker save -o "%EXPORT_DIR%\postgres.tar" postgres
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to save postgres image. Exiting...
    pause
    exit /b %ERRORLEVEL%
)

docker save -o "%EXPORT_DIR%\pgadmin4.tar" dpage/pgadmin4
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to save pgadmin. Exiting...
    pause
    exit /b %ERRORLEVEL%
)

docker save -o  "%EXPORT_DIR%\query-craft-web.tar" query-craft-web
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to save query-craft-web image. Exiting...
    pause
    exit /b %ERRORLEVEL%
)
echo All Docker images saved successfully !

REM Export Docker volumes
echo Exporting Docker volumes...
docker run --rm -v query-craft_postgres_data:/volume -v %BACKUP_DIR%:/backup ubuntu sh -c "mkdir -p /backup && tar cvf /backup/postgres_data.tar /volume"
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to backup volume query-craft_postgres_data. Exiting...
    pause
    exit /b %ERRORLEVEL%
)

docker run --rm -v query-craft_pgadmin_data:/volume -v %BACKUP_DIR%:/backup ubuntu sh -c "mkdir -p /backup && tar cvf /backup/pgadmin_data.tar /volume"
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to backup volume query-craft_pgadmin_data. Exiting...
    pause
    exit /b %ERRORLEVEL%
)

echo All Docker Volumes exported successfully !

echo All tasks completed successfully !

endlocal
pause