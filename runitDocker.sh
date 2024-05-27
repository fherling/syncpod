#!/bin/bash
docker run --name fherling-syncpod --rm -v /Users/fherling/Documents/git/OCR/syncpod/origin:/origin -v /Users/fherling/Documents/git/OCR/syncpod/destination:/destination fherlingatpd/fherling-syncpod:latest /bin/sh -c "while true; do sleep 1; done"
