#!/bin/sh

# Sparky
sed -i "s|SPARKY-SWAGGER-URL|${SPARKY_SWAGGER_URL}|g" /var/www/html/index.html
sed -i "s|SPARKY-API-URL|${FRONTEND_API_BASE_URL}|g" /var/www/html/index.html

# Student-Management-System
sed -i "s|FRONT-END-URL|${FRONTEND_URL}|g" /var/www/html/index.html
sed -i "s|BACKEND-API-URL|${FRONTEND_API_BASE_URL}/stmgmt|g" /var/www/html/index.html
sed -i "s|STU-MGMT-SWAGGER-URL|${BACKEND_SWAGGER_URL}|g" /var/www/html/index.html

# Web-IDE
sed -i "s|WEB-IDE-URL|${WEB_IDE_URL}|g" /var/www/html/index.html

# Exercise-Submitter Server
sed -i "s|EXERCISE-SUBMITTER-API-URL|${SUBMISSION_SERVER_PATH}|g" /var/www/html/index.html

echo "Running $@"
exec "$@"
