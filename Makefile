SERVE=hugo serve --bind 0.0.0.0

draft:	## Serve including draft posts
	$(SERVE) -D

serve:	## Serve
	$(SERVE)

publish:	## Publish site to hosting
	hugo
	rsync -avz --delete public/ $(HOSTING):~/wtf

help:	## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: help
.DEFAULT_GOAL := help
