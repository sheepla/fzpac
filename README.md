# fzpac

Arch Linux package finder with fzf

<image src="./img/screenshot.png" width="70%">

# Usage

```
USAGE
    fzpac SUBCMD KEYWORD

SUBCMD
    s, search     Search all available packages.
    q, query      Search installed packages.
    i, info       Search all available packages...
                  and show detail information that you selected.
    l, info-local Search installed packages...
                  and show detail information that you selected.
```

# Installation

Require `fzf`.

<a href="https://github.com/junegunn/fzf">junegunn/fzf</a>

```bash
# If you not installed fzf...
sudo pacman -S fzf
```

```bash
wget https://raw.githubusercontent.com/sheepla/fzpac/main/fzpac && chmod +x fzpac
```
