# Syncpod

## Overview
A Docker-based solution for monitoring files and copying them with timestamped filenames.

## Container Images
The project automatically builds multi-platform Docker images for both macOS (amd64) and Synology NAS devices (arm64) using GitHub Actions.

### Available Images
- `ghcr.io/fherling/syncpod:latest`: Always points to the latest version
- `ghcr.io/fherling/syncpod:<tag>`: Specific release versions

## Usage
Pull the container image:
```bash
docker pull ghcr.io/fherling/syncpod:latest
```

Run using docker-compose:
```bash
docker-compose up -d
```

## CI/CD
This project uses GitHub Actions to:
1. Build multi-platform Docker images (amd64, arm64)
2. Push images to GitHub Container Registry
3. Apply appropriate tags based on git branches and tags
