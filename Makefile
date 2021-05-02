FZPAC_SRC_PATH := fzpac
FZPAC_DEST_PATH := /usr/local/bin/fzpac
BASH_COMPLETION_SRC_PATH := completions/bash/fzpac
BASH_COMPLETION_DEST_PATH := /usr/share/bash-completion/completions/fzpac

.PHONY: install
install:
	sudo install -o root -g root -m 0755 $(FZPAC_SRC_PATH) $(FZPAC_DEST_PATH)
	sudo install -o root -g root -m 0644 $(BASH_COMPLETION_SRC_PATH) $(BASH_COMPLETION_DEST_PATH)

.PHONY: uninstall
uninstall:
	sudo rm -f $(FZPAC_DEST_PATH)
	sudo rm -f $(BASH_COMPLETION_DEST_PATH)

.PHONY: format
format:
	shfmt -w $(FZPAC_SRC_PATH)
	shfmt -w $(BASH_COMPLETION_SRC_PATH)
