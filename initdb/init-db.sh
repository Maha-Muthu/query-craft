#!/bin/bash
set -e

# Check if the database exists
if psql -U "$POSTGRES_USER" -d postgres -tc "SELECT 1 FROM pg_database WHERE datname = 'yourdbname'" | grep -q 1; then
  echo "Database 'yourdbname' already exists"
else
  # Create the database if it doesn't exist
  psql -U "$POSTGRES_USER" -d postgres -c "CREATE DATABASE yourdbname"
  echo "Database 'yourdbname' created"
fi
