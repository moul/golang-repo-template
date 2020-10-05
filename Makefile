GOPKG ?=	moul.io/golang-repo-template
DOCKER_IMAGE ?=	moul/golang-repo-template
GOBINS ?=	.
NPM_PACKAGES ?=	.

include rules.mk

generate: install
	GO111MODULE=off go get github.com/campoy/embedmd
	mkdir -p .tmp
	echo 'foo@bar:~$$ golang-repo-template hello world' > .tmp/usage.txt
	golang-repo-template hello world 2>&1 >> .tmp/usage.txt
	embedmd -w README.md
	rm -rf .tmp
.PHONY: generate

lint:
	cd tool/lint; make
.PHONY: lint
