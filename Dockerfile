FROM broadinstitute/gatk:4.1.8.1

RUN mkdir /opt/cromwell \
    && wget -O /opt/cromwell/cromwell.jar https://github.com/broadinstitute/cromwell/releases/download/49/cromwell-49.jar

COPY cromwell_run.sh /usr/bin/cromwell_run

RUN chmod a+x /usr/bin/cromwell_run