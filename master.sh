#!/bin/bash - 

source variables.sh

docker run \
    -d \
    --name jenkins_master \
    -p 8080:8080 \
    -p 50000:50000 \
    -u 0 \
    -w /root \
    "${IMAGE}:${TAG}"
