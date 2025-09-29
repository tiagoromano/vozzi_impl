#!/bin/bash
set -e

# Wait for PostgreSQL to be ready
until pg_isready -U postgres -d school_mgmt; do
  echo "Waiting for PostgreSQL to be ready..."
  sleep 2
done

echo "PostgreSQL is ready!"

# Run the SQL files in order
echo "Creating database schema..."
psql -U postgres -d school_mgmt -f /docker-entrypoint-initdb.d/tables.sql

echo "Loading seed data..."
psql -U postgres -d school_mgmt -f /docker-entrypoint-initdb.d/seed-db.sql

echo "Database setup completed successfully!"
