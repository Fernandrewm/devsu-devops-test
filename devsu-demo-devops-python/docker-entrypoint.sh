#!/bin/bash
set -e

cd $APP_HOME

echo "Waiting for PostgreSQL to be ready..."
sleep 5

echo "Running migrations..."
python manage.py makemigrations
python manage.py migrate

exec python manage.py runserver 0.0.0.0:8000
