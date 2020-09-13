#!/bin/bash

set -e

docker build --network=host -t titaniteslab/factorio-server:0.1 .
