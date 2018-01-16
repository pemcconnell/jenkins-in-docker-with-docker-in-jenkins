#!/bin/bash - 

source variables.sh

docker rm -f jenkins_master

while [ $SCALE -gt 0 ]; do
  docker rm -f "jenkins_agent${SCALE}"
  let SCALE=SCALE-1
done
