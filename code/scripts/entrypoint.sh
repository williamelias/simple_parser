#!/bin/sh
set -e
echo "Running docker entrypoint"

if [[ $COMMAND = "runserver" ]];then
    echo "Executing runserver"
    python3 manage.py migrate
    python3 manage.py runserver 0:8000

elif [[ $COMMAND = "gunicorn" ]];then
    echo "Executing gunicorn"
    python3 manage.py migrate
    gunicorn simple_parser.wsgi:application --bind 0.0.0.0:8000

elif [[ $COMMAND = "test" ]];then
    echo "Executing tests"
    python3 manage.py test --parallel
fi

