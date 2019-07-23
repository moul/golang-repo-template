GO ?= go

.PHONY: install
install:
	$(GO) install .

.PHONY: test
test:
	set -e; for dir in `find . -type f -name "go.mod"  | sed -r 's@/[^/]+$$@@' | sort | uniq`; do \
	  (set -xe; cd $$dir; $(GO) test -v -cover -race ./...); \
	done

.PHONY: lint
lint:
	golangci-lint run --verbose ./...

.PHONY: release
release:
	goreleaser --snapshot --skip-publish --rm-dist
	@echo -n "Do you want to release? [y/N] " && read ans && [ $${ans:-N} = y ]
	goreleaser --rm-dist
