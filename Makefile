WORKDIR=$(PWD)

#
# Build version should match the Anchor cli version.
#
IMG_ORG ?= utx0
IMG_VER ?= latest

.PHONY: build build-push build-shell publish

default:

build: build/Dockerfile
	@docker build \
	$@ -t $(IMG_ORG)/solana_build:$(IMG_VER)

build-push:
	@docker push $(IMG_ORG)/solana_build:$(IMG_VER)

build-shell:
	@docker run -ti --rm --net=host \
		-v $(WORKDIR)/..:/workdir \
		$(IMG_ORG)/solana_build:$(IMG_VER) bash

publish: build build-push
