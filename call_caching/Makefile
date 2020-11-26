.PHONY: build run hello clean

all: | clean build hello clean

build:
	@docker build . -t cromwell-test:call_caching
	@docker run -d --name mysql-cromwell --rm --network host -v "$(shell pwd)/mysql/init":/docker-entrypoint-initdb.d -e MYSQL_ROOT_PASSWORD=cromwell -e MYSQL_DATABASE=cromwell_db mysql:5.7

run:
	@docker run --rm --network host -v "$(shell pwd)/src":/app -v "$(shell pwd)/cromwell-executions":/opt/cromwell/cromwell-executions -w /opt/cromwell cromwell-test:call_caching bash -c "/opt/cromwell/cromwell_run /app/$(file) -i /app/$(input)"

clean:
	-@docker rm -f mysql-cromwell
	@rm -rf $(shell pwd)/cromwell-executions/*

hello:
	@$(MAKE) run file=hello.wdl input=hello.json
	@$(MAKE) run file=hello.wdl input=hello.json
