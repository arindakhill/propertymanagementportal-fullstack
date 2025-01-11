#!/bin/bash

# Wait for the backend service to be fully operational
# This is a simple sleep command; adjust the timing as needed, or implement a more robust wait mechanism
sleep 60

# Populate the database
#POSTGRES_PASSWORD
#psql -h postgres -U postgres -d postgres -a -f /usr/data.sql

export PGPASSWORD="1"
psql -h postgres -U postgres -d postgres -a -f /usr/data.sql
unset PGPASSWORD

