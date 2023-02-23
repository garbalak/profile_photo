#!/bin/bash
# echo "-----------------------------------------------------------------------------------------"
# head d0156fee_prod00.sql
# echo "-----------------------------------------------------------------------------------------"
# cat d0156fee_prod00.sql | python manage.py dbshell
# python manage.py loaddata data.json
# mysql -u root -p root ihre_pflege0 < ../../db/d0156fee_prod00.sql

python manage.py migrate
# python manage.py runserver 0.0.0.0:8000
gunicorn server.wsgi:application --bind 0.0.0.0:8000 --reload
