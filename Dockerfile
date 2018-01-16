FROM jenkins/jenkins:latest

# this is our restore process
ADD backups/jenkins_home.tar.gz /var/jenkins_home
# if we were backing up the jenkins war also we could:
#COPY backups/jenkins.war /usr/share/jenkins/jenkins.war
