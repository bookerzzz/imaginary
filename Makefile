build:
	mkdir -p bin
	GOBIN=bin/ go install

test:
	go test

apt-deps:
	apt-get install libgsf-1-dev libvips-dev

bench:
	go test -bench=.

test-load:
	bash bench.sh

docker-build:
	docker build --no-cache=true -t h2non/imaginary:$(VERSION) .

docker-push:
	docker push h2non/imaginary:$(VERSION)

docker: docker-build docker-push

.PHONY: test bench test-load docker-build docker-push docker apt-deps
