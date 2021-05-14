FZPAC_SRC_PATH := fzpac
PREFIX ?= /usr
BINDIR ?= $(PREFIX)/local/bin
SHAREDIR ?= $(PREFIX)/share
FZPAC_DEST_PATH := $(BINDIR)/fzpac
BASH_COMPLETION_SRC_PATH := completions/bash/fzpac
BASH_COMPLETION_DEST_PATH := $(SHAREDIR)/bash-completion/completions/fzpac

.PHONY: install
install:
	install -Dm 0755 $(FZPAC_SRC_PATH) $(DESTDIR)$(FZPAC_DEST_PATH)
	install -Dm 0644 $(BASH_COMPLETION_SRC_PATH) $(DESTDIR)$(BASH_COMPLETION_DEST_PATH)

.PHONY: uninstall
uninstall:
	rm -f $(FZPAC_DEST_PATH)
	rm -f $(BASH_COMPLETION_DEST_PATH)

.PHONY: format
format:
	shfmt -w $(FZPAC_SRC_PATH)
	shfmt -w $(BASH_COMPLETION_SRC_PATH)

.PHONY: lint
lint:
	shellcheck $(FZPAC_SRC_PATH)
	shellcheck $(BASH_COMPLETION_SRC_PATH)
