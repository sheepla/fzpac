# fzpac

Arch Linux package finder with fzf

## Usage

<image src="./img/screenshot.png" width="70%">

```
fzpac -- pacman package finder with fzf

USAGE
    fzpac SUBCMD KEYWORDS...

SUBCMD
    s, search        Search all available packages and select.
    q, search-local  Search installed packages and select.
    i, info          Search all available packages,
                     and show detail information that you selected.
    l, info-local    Search installed packages,
                     and show detail information that you selected.
    S, install       Select packages and install that you selected.
    R, remove        Select packages and uninstall that you selected.
    h, help          Show this usage.
```

## Installation

Require `fzf`.

<a href="https://github.com/junegunn/fzf">junegunn/fzf</a>

```bash
# If you not installed fzf...
sudo pacman -S fzf
```

Just download and add execution permission.

```bash
wget https://raw.githubusercontent.com/sheepla/fzpac/main/fzpac && chmod +x fzpac
```

