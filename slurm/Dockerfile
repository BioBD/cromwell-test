FROM giovtorres/slurm-docker-cluster:latest

EXPOSE 6818

ENV SINGULARITY_CACHEDIR=$HOME/.singularity/cache

RUN yum install -y docker java-11-openjdk singularity singularity-runtime \
    && mkdir /opt/cromwell \
    && wget -O /opt/cromwell/cromwell.jar https://github.com/broadinstitute/cromwell/releases/download/49/cromwell-49.jar

# pre build images
RUN echo "user.max_user_namespaces=15076" >> /etc/sysctl.conf \
    && singularity build --sandbox broadinstitute_gatk docker://broadinstitute/gatk@sha256:8051adab0ff725e7e9c2af5997680346f3c3799b2df3785dd51d4abdd3da747b

ADD cromwell-application.conf /opt/cromwell/cromwell-application.conf
ADD cromwell_run.sh /opt/cromwell/cromwell_run

ENTRYPOINT ["/bin/bash","-c","/opt/cromwell/cromwell_run ${*}"]