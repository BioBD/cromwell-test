.PHONY: build run hello optional subflow

all: | build hello subflow optional

build:
	@docker build . -t cromwell-test:wdl_versions

run:
	@docker run --rm -v "$(shell pwd)/src":/app -w /opt/cromwell cromwell-test:wdl_versions bash -c "cromwell_run /app/$(file) -i /app/$(input)"

hello:
	@$(MAKE) run file=hello.wdl input=hello.json

optional:
	@$(MAKE) run file=optional_test/workflow_2.wdl input=optional_test/defined.json
	@$(MAKE) run file=optional_test/workflow_2.wdl input=optional_test/undefined.json
	@-$(MAKE) run file=optional_test/workflow_3.wdl input=optional_test/defined.json
	@-$(MAKE) run file=optional_test/workflow_3.wdl input=optional_test/undefined.json

subflow:
	@-$(MAKE) run file=subflow_test/workflow.wdl input=subflow_test/input.json