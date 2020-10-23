FROM ensemblorg/ensembl-vep:release_101.0

USER root

RUN mkdir -p /opt/vep/cache \
    && curl -O ftp://ftp.ensembl.org/pub/release-101/variation/vep/homo_sapiens_vep_101_GRCh38.tar.gz \
    && tar xvzf homo_sapiens_vep_101_GRCh38.tar.gz -C /opt/vep/cache

RUN apt-get update && apt-get install -y wget default-jre \
    && wget -O /opt/vep/Homo_sapiens_assembly38.fasta https://storage.googleapis.com/gcp-public-data--broad-references/hg38/v0/Homo_sapiens_assembly38.fasta \
    && mkdir -p /opt/cromwell \
    && wget -O /opt/cromwell/cromwell.jar https://github.com/broadinstitute/cromwell/releases/download/49/cromwell-49.jar

COPY cromwell_run.sh /usr/bin/cromwell_run

RUN chmod a+x /usr/bin/cromwell_run