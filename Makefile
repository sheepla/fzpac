PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
SHAREDIR ?= /usr/share

FZPAC_SRC_PATH := fzpac
FZPAC_DEST_PATH := $(BINDIR)/fzpac
BASH_COMPLETION_SRC_PATH := completions/bash/fzpac
BASH_COMPLETION_DEST_PATH := $(SHAREDIR)/bash-completion/completions/fzpac
FISH_COMPLETION_SRC_PATH := completions/fish/fzpac.fish
FISH_COMPLETION_DEST_PATH := $(SHAREDIR)/fish/completions/fzpac.fish

.PHONY: echo
echo:
	echo $(FZPAC_SRC_PATH)
	echo $(FZPAC_DEST_PATH)
	echo $(BASH_COMPLETION_SRC_PATH )
	echo $(BASH_COMPLETION_DEST_PATH)
	echo $(FISH_COMPLETION_SRC_PATH )
	echo $(FISH_COMPLETION_DEST_PATH)

.PHONY: install
install:
	install -Dm 0755 $(FZPAC_SRC_PATH)           $(DESTDIR)$(FZPAC_DEST_PATH)
	install -Dm 0644 $(BASH_COMPLETION_SRC_PATH) $(DESTDIR)$(BASH_COMPLETION_DEST_PATH)
	install -Dm 0644 $(FISH_COMPLETION_SRC_PATH) $(DESTDIR)$(FISH_COMPLETION_DEST_PATH)

.PHONY: uninstall
uninstall:
	rm -f $(DESTDIR)$(FZPAC_DEST_PATH)
	rm -f $(DESTDIR)$(BASH_COMPLETION_DEST_PATH)
	rm -f $(DESTDIR)$(FISH_COMPLETION_DEST_PATH)

.PHONY: format
format:
	shfmt -w $(FZPAC_SRC_PATH)
	shfmt -w $(BASH_COMPLETION_SRC_PATH)
	shfmt -w $(FISH_COMPLETION_SRC_PATH)

.PHONY: lint
lint:
	shellcheck $(FZPAC_SRC_PATH)
	shellcheck $(BASH_COMPLETION_SRC_PATH)
	shellcheck $(FISH_COMPLETION_SRC_PATH)
