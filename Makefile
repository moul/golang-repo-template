GO ?= go

.PHONY: install
install:
	$(GO) install .

.PHONY: test
test:
	echo "" > /tmp/coverage.txt
	set -e; for dir in `find . -type f -name "go.mod"  | sed -r 's@/[^/]+$$@@' | sort | uniq`; do ( set -xe; \
	  cd $$dir; \
	  $(GO) test -v -cover -coverprofile=/tmp/profile.out -covermode=atomic -race ./...; \
	  if [ -f /tmp/profile.out ]; then \
	    cat /tmp/profile.out >> /tmp/coverage.txt; \
	    rm -f /tmp/profile.out; \
	  fi); done
	mv /tmp/coverage.txt .

.PHONY: lint
lint:
	golangci-lint run --verbose ./...

.PHONY: release
release:
	goreleaser --snapshot --skip-publish --rm-dist
	@echo -n "Do you want to release? [y/N] " && read ans && [ $${ans:-N} = y ]
	goreleaser --rm-dist
