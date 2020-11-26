.PHONY: build run hello

all: | build hello hello_without_docker

build:
	@docker build . -t cromwell-test:slurm
	-@docker network create -d bridge cromwell-network
	@docker-compose up -d
	-@bash register-cluster.sh

run:
	@docker run -v /var/run/docker.sock:/var/run/docker.sock --hostname c2 --name c2 --network cromwell-network --expose 6818 --rm -v etc_munge:/etc/munge -v etc_slurm:/etc/slurm -v slurm_jobdir:/data -v var_log_slurm:/var/log/slurm -v $(shell pwd)/src:/wf cromwell-test:slurm run /wf/$(file) -i /wf/$(input)

hello_without_docker:
	@$(MAKE) run file=hello_without_docker.wdl input=hello.json
hello:
	@$(MAKE) run file=hello.wdl input=hello.json
