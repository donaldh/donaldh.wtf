HUGO ?= ~/git/hugo/hugo
ARGS ?= --bind 0.0.0.0 --baseURL "http://`hostname`:1313/"

draft:	## Serve including draft posts
	$(HUGO) serve $(ARGS) -D -F

serve:	## Serve
	$(HUGO) serve $(ARGS)

publish:	## Publish site to hosting
	$(HUGO)
	rsync -avz --delete public/ $(HOSTING):~/wtf

help:	## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: help
.DEFAULT_GOAL := help
