Docker-in-Jenkins, on Jenkins-in-Docker
=======================================

This repo is largely just a bit of fun, but demos some basic backup and restore
functionality. **do not use this in production**

Instructions
------------

Adjust the configuration in `variables.sh` to suit your needs, then proceed to
run:

```
# run the master
./master.sh

# run agents
./agents.sh
```

If you would like to perform a "backup" of the jenkins_master into a local `./backups` folder you can do so by running:

```
./external_backup.sh
```

If you would like to clean everything up, run:

```
./cleanup.sh
```


docker-Li386
------------

This directory in the root contains some docker binaries for the containers
to use. This could easily be backed into the images rather than mounted as a volume - I simply chose to have the binaries passed in to keep the images lighter
