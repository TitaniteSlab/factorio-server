#!/bin/bash

set -e

echo "Downloading saves..."

aws s3 sync s3://factorio1/saves/ /opt/factorio/saves

echo "Saves downloaded successfully!"
ls -la /opt/factorio/saves
