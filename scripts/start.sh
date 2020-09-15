#!/bin/bash

set -e


# Make credential metadata available to factorio user processes
AWS_CRED_URI_VAR=$(strings /proc/1/environ | grep AWS_CONTAINER_CREDENTIALS_RELATIVE_URI)
echo "export $AWS_CRED_URI_VAR" >> /home/factorio/.profile

# Download existing saves from S3
su -c './scripts/load-saves.sh' factorio

# Start save sync cron
crond

# Start server
echo "Starting server with save: $1..."
su -c "./bin/x64/factorio --start-server ./saves/$1.zip" factorio
