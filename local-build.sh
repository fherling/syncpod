#!/bin/zsh
# Local build and test script

echo "Building local Docker image..."
docker build -t ghcr.io/fherling/syncpod:local .

echo "Running basic tests..."
docker run --rm -it ghcr.io/fherling/syncpod:local /bin/sh -c "ls -la /shellscripts/"

echo "To push manually to GitHub Container Registry:"
echo "1. Login: docker login ghcr.io -u fherling"
echo "2. Push: docker push ghcr.io/fherling/syncpod:local"
echo ""
echo "Note: CI/CD will handle automatic builds and pushes when code is pushed to GitHub."
