GOPKG ?=	moul.io/golang-repo-template
DOCKER_IMAGE ?=	moul/golang-repo-template
GOBINS ?=	.

all: test install

-include rules.mk
