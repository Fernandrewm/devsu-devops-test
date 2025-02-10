#!/bin/bash
set -e

DB_NAME=$(echo $DATABASE_NAME | tr -d "'")
DATA_DIR=${DATA_DIR:-"/app/data"}
APP_HOME=${APP_HOME:-"/app"}

mkdir -p $DATA_DIR

sleep 5

if [ ! -f "$DATA_DIR/db.sqlite3" ]; then
  echo "Initializing database..."
  touch "$DATA_DIR/$DB_NAME"
  ln -sf "$DATA_DIR/$DB_NAME" "$APP_HOME/$DB_NAME"
  python manage.py makemigrations
  python manage.py migrate
fi

exec python manage.py runserver 0.0.0.0:8000
