#!/bin/bash

set -e

echo "Syncing saves..."

/usr/local/bin/aws s3 sync /opt/factorio/saves s3://factorio1/saves/

echo "Saves synced successfully!"
