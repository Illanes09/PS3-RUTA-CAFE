#!/bin/sh
set -e

if [ -z "$DB_HOST" ] || [ -z "$DB_USER" ]; then
  echo "❌ ERROR: Configura DB_HOST, DB_USER, DB_PASS, DB_NAME y DB_PORT en Render → Environment"
  exit 1
fi

echo "Esperando MySQL en ${DB_HOST}:${DB_PORT:-3306}..."

attempt=0
max_attempts=30

until node scripts/wait-for-db.js; do
  attempt=$((attempt + 1))
  if [ "$attempt" -ge "$max_attempts" ]; then
    echo "❌ No se pudo conectar a MySQL tras ${max_attempts} intentos."
    echo "   Railway: servicio MySQL en ejecución, Public Networking ON."
    echo "   Render → Environment: DB_HOST, DB_USER, DB_PASS, DB_NAME=railway"
    echo "   DB_PORT = puerto público de Railway (ej. 21299, NO 3306)."
    echo "   DB_SSL=true (o host *.rlwy.net activa SSL automático)."
    exit 1
  fi
  sleep 3
done

echo "MySQL disponible. Iniciando backend..."
exec "$@"
