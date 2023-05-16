#!/bin/bash

# docker buildx build --platform linux/amd64 -t uefi-builder:v1.0.0 .
docker buildx build -t uefi-builder:v1.0.0 .