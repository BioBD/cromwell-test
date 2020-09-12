.PHONY: build run

build:
	@docker build . -t cromwell-test:latest

run:
	@docker run --rm -v "$(shell pwd)/src":/app -w /opt/cromwell cromwell-test:latest bash -c "cromwell_run /app/$(file) -i /app/$(input)"