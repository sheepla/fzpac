# 🔎 fzpac

*fzpac* is an Arch Linux package finder with `fzf`.

## Features

- Quickly find the packages you are looking for with fuzzy search and preview.
- You can immediately install / uninstall the packages that you selected.
- Supports tab completion in bash.

<image src="./img/screenshot.png" width="70%">

## Usage

### Run This Command

```
fzpac -- Arch Linux package finder with fzf

USAGE
    fzpac SUBCMD KEYWORDS...

SUBCMD
    s, select        SEARCH FOR: all available packages
                     RUN:        pacman -Ssq -> fzf
                     STDOUT:     only names of selected packages
    q, select-local  SEARCH FOR: already installed packages
                     RUN:        pacman -Qsq -> fzf
                     STDOUT:     only names of selected packages

    i, info          SEARCH FOR: all available packages
                     RUN:        pacman -Ssq -> fzf -> pacman -Sii
                     STDOUT:     detailed information on selected packages
    l, info-local    SEARCH FOR: already installed packages
                     RUN:        pacman -Qsq -> fzf -> pacman -Qil
                     STDOUT:     detailed information on selected packages

    p, view          SEARCH FOR: all available packages
                     RUN:        pacman -Ssq -> fzf <--> pacman -Sii|less
                     STDOUT:     none
    v, view-local    SEARCH FOR: already installed packages
                     RUN:        pacman -Qsq -> fzf <--> pacman -Qil|less
                     STDOUT:     none

    S, install       Select packages and INSTALL it.
                     SEARCH FOR: all available packages
                     RUN:        pacman -Ssq -> fzf -> sudo pacman -S

    R, remove        Select packages and UNINSTALL it.
                     SEARCH FOR: already installed packages
                     RUN:        pacman -Qsq -> fzf -> sudo pacman -Rn

    A, autoremove    Select packages that are no longer needed and UNINSTALL it.
                     SEARCH FOR: dependencies that are no longer needed
                     RUN:        pacman -Qdtq -> fzf -> sudo pacman -Rns

    h, help          Show this usage.
    V, version       Show version.

```

### Select the Packages with `fzf`

When `fzf` is started, detailed information about the package will be displayed in the preview pane.

- Press `Ctrl+N` / `Ctrl+P` or `Ctrl+J` / `Ctrl+K` to move focus.
- You can select multiple items by pressing the `Tab` key.
- Press `Enter` to confirm your selection.

### View info / Install / Uninstall

You can view detailed information of the packages that you selected or install / uninstall it.

## Installation

### Dependence

Requires `fzf`.

<a href="https://github.com/junegunn/fzf">junegunn/fzf</a>

If `fzf` is not installed, install it with the following command:

```bash
sudo pacman -S fzf
```

### Optional

#### AUR Helper

If you have the following AUR helpers installed, `fzpac` will use that command in preference to `pacman` .

<ul>
    <li><a href="https://github.com/Morganamilo/paru">Morganamilo/paru</a></li>
    <li><a href="https://github.com/Jguer/yay">Jguer/yay</a></li>
</ul>

#### Bash Completion

To use Tab completion with bash, install the `bash-completion` package.

```bash
sudo pacman -S bash-completion
```

Then, add the following contents to your `~/.bashrc` .

```bash
_set_completion() {
    local bash_completion
    bash_completion='/usr/share/bash-completion/bash_completion'
    [ -f "${bash_completion}" ] && source "${bash_completion}"
}

_set_completion
```

#### Zsh Completion

To use Tab completion with zsh, copy `completions/zsh/_fzpac` to your `$fpath`.

```bash
git clone https://github.com/sheepla/fzpac
cd fzpac
cp -p completions/zsh/_fzpac {path to your fpath}
```

And activate zsh completions on your `.zshrc`.

```.zshrc
autoload -U compinit
compinit -u
```

### Installation

Run below if you want to install `fzpac` and `bash-completion` for `fzpac`.

```bash
git clone https://github.com/sheepla/fzpac
cd fzpac
sudo make install
```

### Manual Installation

<details>
<summary>To install manually...</summary>
<div>
Download `fzpac` and add execution permission.

```bash
# wget
wget https://raw.githubusercontent.com/sheepla/fzpac/main/fzpac && chmod +x fzpac

# curl
curl -O https://raw.githubusercontent.com/sheepla/fzpac/main/fzpac && chmod +x fzpac
```

Run below if you want to use `bash-completion` for `fzpac`.

```bash
wget -O fzpac https://raw.githubusercontent.com/sheepla/fzpac/main/completions/bash/fzpac
sudo install -o root -g root -m 0644 fzpac /usr/share/bash-completion/completions/fzpac
# or curl
```

</div>
</details>
