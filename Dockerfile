FROM jenkins/jenkins:latest

# this is our restore process
ADD backups/backup.tar.gz /var/jenkins_home
