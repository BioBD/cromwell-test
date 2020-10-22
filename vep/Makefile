.PHONY: build run vep

build:
	@docker build . -t cromwell-test:vep

run:
	@docker run -it --rm -v "$(shell pwd)/src":/app -w /opt/cromwell cromwell-test:vep bash -c "cromwell_run /app/$(file) -i /app/$(input)"

vep:
	@$(MAKE) run file=simple_vep.wdl input=simple_vep.json

all: | build vep