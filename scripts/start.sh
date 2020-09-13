#!/bin/bash

set -e

su -c './scripts/load-saves.sh' factorio

crond

su -c './bin/x64/factorio --start-server ./saves/Local4.zip' factorio
