#!/bin/sh

nohup /usr/local/bin/docker-entrypoint.sh slurmd -- &
/bin/bash -c "java -Dconfig.file=/opt/cromwell/cromwell-application.conf ${JAVA_OPTS} -jar /opt/cromwell/cromwell.jar run ${*}"