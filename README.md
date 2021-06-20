<h1><div align="center"> 🔎 fzpac</div></h1>

<div align="center"><i>fzpac</i> is an Arch Linux package finder with fzf.</div>

## Features

- Quickly find the packages you are looking for with fuzzy search and preview.
- You can immediately install / uninstall the packages that you selected.
- Supports tab completion in `bash`, `fish` and `zsh`.

<image src="./img/screenshot.png" width="70%">

## Try fzpac

To try `fzpac` quickly, run the following command:

```bash
curl -O https://raw.githubusercontent.com/sheepla/fzpac/main/fzpac && chmod +x fzpac
```

## Usage

1. Run this command
2. Select the packages with `fzf`
3. You can view the package info or install / uninstall it immediately

### Help

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

#### Tab Completion on the Shells

##### bash

To use Tab completion with bash, install the `bash-completion` package.

```bash
sudo pacman -S bash-completion
```

then, add the following contents to your `~/.bashrc` .

```bash
_set_completion() {
    local bash_completion
    bash_completion='/usr/share/bash-completion/bash_completion'
    [ -f "${bash_completion}" ] && source "${bash_completion}"
}

_set_completion
```

##### fish

Complete functions are built into `fish` so you don't need to install any additional packages.

##### zsh

To use Tab completion with zsh, requires `zsh-completions` package.

```zsh
sudo pacman -S zsh-completions
```

then, activate zsh completions on your `.zshrc`.

```.zshrc
autoload -U compinit
compinit -u
```

### Installation

Run below if you want to install `fzpac` and completion file of the shells for `fzpac`.

```bash
git clone https://github.com/sheepla/fzpac
cd fzpac
sudo make install
```

### Development

Issue & PR is welcome!❤
