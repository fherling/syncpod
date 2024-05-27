#!/bin/bash

docker buildx build --platform linux/amd64,linux/arm64/v8 -f Dockerfile -t fherlingatpd/fherling-syncpod:latest .
docker push fherlingatpd/fherling-syncpod:latest

