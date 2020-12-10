.PHONY: build run with_cache without_cache with_subflow clean_before clean_after

all: | clean_before build with_cache without_cache with_subflow clean_after

build:
	@docker build . -t cromwell-test:call_caching
	@docker run -d --name mysql-cromwell --rm --network host -v "$(shell pwd)/mysql/init":/docker-entrypoint-initdb.d -e MYSQL_ROOT_PASSWORD=cromwell -e MYSQL_DATABASE=cromwell_db mysql:5.7
	@sleep 10
run:
	@docker run --rm --network host -v "$(shell pwd)/src":/app -v "$(shell pwd)/cromwell-executions":/opt/cromwell/cromwell-executions -w /opt/cromwell cromwell-test:call_caching bash -c "/opt/cromwell/cromwell_run /app/$(file) -i /app/$(input)"

clean_before clean_after:
	-@docker rm -f mysql-cromwell
	-@rm -rf $(shell pwd)/cromwell-executions/*

with_cache:
	@$(MAKE) run file=hello.wdl input=input1.json
	@$(MAKE) run file=hello.wdl input=input1.json

without_cache:
	@$(MAKE) run file=hello.wdl input=input1.json
	@$(MAKE) run file=hello.wdl input=input2.json

with_subflow:
	@$(MAKE) run file=subflows/workflow.wdl input=subflows/input1.json
	@$(MAKE) run file=subflows/workflow.wdl input=subflows/input2.json