#!/bin/bash - 

# a very hacky way to show the creation of jenkins swarm agents
# there's really no value in running "agents" as containers

source variables.sh

docker rm -f jenkins_master

while [ $SCALE -gt 0 ]; do
  docker rm -f "jenkins_agent${SCALE}"
  let SCALE=SCALE-1
done
