#!/bin/bash

java -Dconfig.file=/opt/cromwell/cromwell-application.conf -jar /opt/cromwell/cromwell.jar run "$@"