GOPKG ?=	moul.io/golang-repo-template
DOCKER_IMAGE ?=	moul/golang-repo-template
GOBINS ?=	.
NPM_PACKAGES ?=	.

all: test install

-include rules.mk
