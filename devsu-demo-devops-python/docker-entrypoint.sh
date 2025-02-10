#!/bin/bash
set -e

cd $APP_HOME

# Esperar a que PostgreSQL esté disponible
echo "Waiting for PostgreSQL to be ready..."
sleep 5

# Inicializar la base de datos
echo "Running migrations..."
python manage.py makemigrations
python manage.py migrate

# Iniciar el servidor
exec python manage.py runserver 0.0.0.0:8000
