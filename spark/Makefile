.PHONY: build run hello without_spark with_spark

all: | build hello without_spark with_spark

build:
	@docker build . -t cromwell-test:spark

run:
	@docker run --rm -v "$(shell pwd)/src":/app -w /opt/cromwell cromwell-test:spark bash -c "/opt/cromwell/cromwell_run /app/$(file) -i /app/$(input)"

hello:
	@$(MAKE) run file=hello.wdl input=hello.json

with_spark:
	@$(MAKE) run file=with_spark/print_reads.wdl input=hello.json
	@-$(MAKE) run file=with_spark/base_recalibrator.wdl input=hello.json

without_spark:
	@$(MAKE) run file=without_spark/print_reads.wdl input=hello.json
	@-$(MAKE) run file=without_spark/base_recalibrator.wdl input=hello.json
