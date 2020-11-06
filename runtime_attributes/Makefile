.PHONY: build run hello

all: | build hello

build:
	@docker build . -t cromwell-test:runtime_attributes

run:
	@docker run --rm -v "$(shell pwd)/src":/app -w /opt/cromwell cromwell-test:runtime_attributes bash -c "/opt/cromwell/cromwell_run /app/$(file) -i /app/$(input)"

hello:
	@$(MAKE) run file=hello.wdl input=hello.json
