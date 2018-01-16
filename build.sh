#!/bin/bash - 

source variables.sh

docker build -t="${IMAGE}:${TAG}" .
