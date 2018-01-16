#!/bin/bash - 

# create a tar in the image ...
docker exec -ti jenkins_master \
  sh -c "\
    cd /var/jenkins_home && \
    (mkdir /tmp/backup || true) && \
      cp ./*.xml /tmp/backup/ && \
      cp -r ./users /tmp/backup/ && \
      cp -r ./jobs /tmp/backup/ && \
      cp -r ./plugins /tmp/backup/ && \
      (cp -r ./workflow-libs /tmp/backup/ || true) && \
    cd /tmp/backup && \
      tar -zcvf /tmp/backup.tar.gz ."

# copy the tar onto the host ...
docker cp jenkins_master:/tmp/backup.tar.gz ./backups/jenkins_home.tar.gz

# if we wanted to backup the version of jenkins itself we could do:
#docker cp jenkins_master:/usr/share/jenkins/jenkins.war ./backups/jenkins.war
