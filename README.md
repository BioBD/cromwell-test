# cromwell-test
Testing with Cromwell workflow

## Installing

Needs Docker and Docker Compose to run.

## Running

### WDL Versions

Running tests with version draft-2 and draft-3 (1.0)

```
make wdl_versions
```

### VEP

Running VEP experiments

```
make vep
```

### SLURM Cluster with Singularity

Running Docker with Singularity submission to SLURM cluster (WIP)

```
make slurm
```
