.PHONY: default build test install

default: build

test:
	@printf "\033[01;33m>> Running tests\033[0m\n"
	go test -cover -race $$(go list ./... | grep -v /vendor/ | grep -v /integration | tr "\n" " ")

build: test
	@printf "\033[01;33m>> Running build\033[0m\n"
	go build -o bin/release ./cmd/release

install: test
	@printf "\033[01;33m>> Running install\033[0m\n"
	go install ./cmd/release
