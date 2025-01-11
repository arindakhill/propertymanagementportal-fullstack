#!/bin/bash

# Wait for the PostgreSQL service to be ready
/usr/wait-for-it.sh postgres:5432 --timeout=30

# Start the Java application
exec java -jar /app/my-application.jar
