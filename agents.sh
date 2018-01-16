#!/bin/bash - 

# a very hacky way to show the creation of jenkins swarm agents
# there's really no value in running "agents" as containers

source variables.sh

while [ $SCALE -gt 0 ]; do
  docker run \
      -d \
      --name "jenkins_agent${SCALE}" \
      --link jenkins_master:jenkins \
      -u 0 \
      -e JENKINS_PORT_8080_TCP_ADDR=jenkins \
      -e PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/bin/docker \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v "$(pwd)/docker-Li386":/usr/local/bin/docker \
      csanchez/jenkins-swarm-slave \
        -username "${SWARM_USERNAME}" \
        -password "${SWARM_PASSWORD}" \
        -executors "${EXECUTORS}" \
        -disableSslVerification
  let SCALE=SCALE-1
done
