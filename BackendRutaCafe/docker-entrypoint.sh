#!/bin/sh
set -e

echo "Esperando MySQL en ${DB_HOST}:${DB_PORT:-3306}..."

until node scripts/wait-for-db.js; do
  sleep 2
done

echo "MySQL disponible. Iniciando backend..."
exec "$@"
