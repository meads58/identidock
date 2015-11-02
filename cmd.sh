#!/bin/bash
set -e

if [ "$ENV" = "DEV" ]; then
	echo "Running Development Server"
	exec python "identidock.py"
else
	echo "Running Production server"
	exec uwsgi --http 0.0.0.0:3000 --wsgi-file /app/identidock.py --callable app --stats 0.0.0.0:9191
fi