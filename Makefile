NAME = fzpac

PREFIX ?= /usr/local
BINDIR := $(PREFIX)/bin
SHAREDIR := $(PREFIX)/share

FZPAC_SRC_PATH := fzpac
FZPAC_DEST_PATH := $(BINDIR)/fzpac

BASH_COMPLETION_SRC_PATH := completions/bash/fzpac
BASH_COMPLETION_DEST_PATH := $(SHAREDIR)/bash-completion/completions/fzpac

FISH_COMPLETION_SRC_PATH := completions/fish/fzpac.fish
FISH_COMPLETION_DEST_PATH := $(SHAREDIR)/fish/completions/fzpac.fish

ZSH_COMPLETION_SRC_PATH := completions/zsh/_fzpac
ZSH_COMPLETION_DEST_PATH := $(SHAREDIR)/zsh/site-functions/_fzpac

LICENSE_SRC_PATH := LICENSE
LICENSE_DEST_PATH := $(SHAREDIR)/licenses/$(NAME)/LICENSE

README_SRC_PATH := README.md
README_DEST_PATH := $(SHAREDIR)/doc/$(NAME)/README.md

DOCKER_TOOL_IMAGE := tools
DOCKER_LINT_CMD := docker run --rm -v $$PWD:/work -w /work $(DOCKER_TOOL_IMAGE)

.PHONY: help
help: ## Print help documents
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: echo
echo: ## Print source paths and destination paths
	echo FZPAC_SRC_PATH: $(FZPAC_SRC_PATH)
	echo FZPAC_DEST_PATH: $(FZPAC_DEST_PATH)
	echo BASH_COMPLETION_SRC_PATH: $(BASH_COMPLETION_SRC_PATH)
	echo BASH_COMPLETION_DEST_PATH: $(BASH_COMPLETION_DEST_PATH)
	echo FISH_COMPLETION_SRC_PATH: $(FISH_COMPLETION_SRC_PATH)
	echo FISH_COMPLETION_DEST_PATH: $(FISH_COMPLETION_DEST_PATH)
	echo ZSH_COMPLETION_SRC_PATH: $(ZSH_COMPLETION_SRC_PATH)
	echo ZSH_COMPLETION_DEST_PATH: $(ZSH_COMPLETION_DEST_PATH)
	echo README_SRC_PATH: $(README_SRC_PATH)
	echo README_DEST_PATH: $(README_DEST_PATH)
	echo LICENSE_SRC_PATH: $(LICENSE_SRC_PATH)
	echo LICENSE_DEST_PATH: $(LICENSE_DEST_PATH)

.PHONY: install
install: ## Install programs
	install -Dm 0755 $(FZPAC_SRC_PATH) $(FZPAC_DEST_PATH)
	install -Dm 0644 $(BASH_COMPLETION_SRC_PATH) $(BASH_COMPLETION_DEST_PATH)
	install -Dm 0644 $(FISH_COMPLETION_SRC_PATH) $(FISH_COMPLETION_DEST_PATH)
	install -Dm 0644 $(ZSH_COMPLETION_SRC_PATH) $(ZSH_COMPLETION_DEST_PATH)
	install -Dm 0644 $(README_SRC_PATH) $(README_DEST_PATH)
	install -Dm 0644 $(LICENSE_SRC_PATH) $(LICENSE_DEST_PATH)

.PHONY: uninstall
uninstall: ## Uninstall programs
	rm -f $(FZPAC_DEST_PATH)
	rm -f $(BASH_COMPLETION_DEST_PATH)
	rm -f $(FISH_COMPLETION_DEST_PATH)
	rm -f $(ZSH_COMPLETION_DEST_PATH)
	rm -f $(README_DEST_PATH)
	rm -f $(LICENSE_DEST_PATH)

.PHONY: format
format: ## Format code and write a file
	shfmt -w $(FZPAC_SRC_PATH)
	#shfmt -w $(BASH_COMPLETION_SRC_PATH)
	#shfmt -w $(FISH_COMPLETION_SRC_PATH)
	#shfmt -w $(ZSH_COMPLETION_SRC_PATH)

.PHONY: lint
lint: ## Lint code
	shellcheck $(FZPAC_SRC_PATH)
	#shellcheck $(BASH_COMPLETION_SRC_PATH)
	#shellcheck $(ZSH_COMPLETION_SRC_PATH)

.PHONY: setup_tools
setup_tools: ## Setup linter tools
	docker build -t $(DOCKER_TOOL_IMAGE) tools/linter

.PHONY: check_format_on_docker
check_format_on_docker: ## Check format code on docker
	$(DOCKER_LINT_CMD) shfmt -d $(FZPAC_SRC_PATH)

.PHONY: lint_on_docker
lint_on_docker: ## Lint code on docker
	$(DOCKER_LINT_CMD) shellcheck $(FZPAC_SRC_PATH)
