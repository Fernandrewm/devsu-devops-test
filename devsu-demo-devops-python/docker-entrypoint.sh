#!/bin/bash
set -e

DB_NAME=$(echo $DATABASE_NAME | tr -d "'")
DATA_DIR=${DATA_DIR:-"/app/data"}
APP_HOME=${APP_HOME:-"/app"}

mkdir -p $DATA_DIR

sleep 5

cd $APP_HOME

if [ ! -f "$DATA_DIR/db.sqlite3" ]; then
  echo "Initializing database..."
  touch "$DATA_DIR/$DB_NAME"
  export DATABASE_NAME="$DATA_DIR/$DB_NAME"
  python manage.py makemigrations
  python manage.py migrate
fi

export DATABASE_NAME="$DATA_DIR/$DB_NAME"
exec python manage.py runserver 0.0.0.0:8000
