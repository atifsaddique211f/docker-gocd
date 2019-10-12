#!/bin/bash

echo "GOCD_VERSION: v19.9.0"
echo "DOCKER TAG: v19.9.0"

docker build --tag "atifsaddique/gocd-server:v19.9.0"  --no-cache=true .