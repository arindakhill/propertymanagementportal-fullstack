#!/bin/bash

# Start backend service
/app/start-backend.sh &

# Wait for the backend to initialize (Adjust the sleep as necessary based on your application's startup time)
sleep 30

# Now run the DB population script
/app/populate-db.sh

# You could monitor or log here, but typically, the Java app would be the foreground process.
wait
