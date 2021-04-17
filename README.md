# fzpac

Arch Linux package finder with fzf

<<<<<<< HEAD
## Usage
=======
<image src="./img/screenshot.png" width="70%">

# Usage
>>>>>>> b2cd0a3ca952e5f912402fa4c0375434695386f4

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

