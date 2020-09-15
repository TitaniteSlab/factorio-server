#!/bin/bash

set -e

echo "Downloading saves..."
echo "AWS_CONTAINER_CREDENTIALS_RELATIVE_URI: $AWS_CONTAINER_CREDENTIALS_RELATIVE_URI"
aws s3 sync s3://factorio1/saves/ /opt/factorio/saves

echo "Saves downloaded successfully!"
ls -la /opt/factorio/saves
