.DEFAULT_GOAL := help

# https://gist.github.com/tadashi-aikawa/da73d277a3c1ec6767ed48d1335900f3
.PHONY: $(shell grep -E '^[a-zA-Z_-]+:' $(MAKEFILE_LIST) | sed 's/://')


# Constant definitions
REPO_NAME := tmknom/textlint
DOCKER_REPO := index.docker.io/${REPO_NAME}
IMAGE_TAG := latest
IMAGE_NAME := $(shell echo ${DOCKER_REPO} | cut -d / -f 2,3):${IMAGE_TAG}


# Phony Targets
install: ## Install requirements
	@type docker >/dev/null 2>&1 || (echo "ERROR: docker not found (brew install docker)"; exit 1)
	docker pull hadolint/hadolint
	docker pull tmknom/markdownlint
	docker pull koalaman/shellcheck
	docker pull jamesmstone/shfmt
	docker pull tmknom/prettier

build: ## Build docker image
	DOCKER_REPO=${DOCKER_REPO} DOCKER_TAG=${IMAGE_TAG} IMAGE_NAME=${IMAGE_NAME} hooks/build
	docker images ${REPO_NAME}

lint: lint-markdown lint-dockerfile lint-shellscript ## Lint code

lint-markdown:
	docker run --rm -i -v "$(CURDIR):/work" tmknom/markdownlint

lint-dockerfile:
	docker run --rm -i hadolint/hadolint < Dockerfile

lint-shellscript:
	docker run --rm -v "$(CURDIR):/mnt" koalaman/shellcheck hooks/build

format: format-shellscript format-markdown format-json ## Format code

format-shellscript:
	docker run --rm -v "$(CURDIR):/work" -w /work jamesmstone/shfmt -i 2 -ci -kp -w hooks/build

format-markdown:
	docker run --rm -v "$(CURDIR):/work" tmknom/prettier --parser=markdown --write '**/*.md'

format-json:
	docker run --rm -v "$(CURDIR):/work" tmknom/prettier --parser=json --write '**/*.json'


# https://postd.cc/auto-documented-makefile/
help: ## Show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
