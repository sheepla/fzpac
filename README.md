<div align="center"><h1> 🔎 fzpac</h1></div>

<div align="right">
    <img src="https://img.shields.io/static/v1?label=Language&message=shell&color=blue&style=flat-square"/>
    <img src="https://img.shields.io/static/v1?label=License&message=MIT&color=blue&style=flat-square"/>
</div>

<div align="center">
    
`fzpac` is a `pacman` wrapper, an Arch Linux package finder with `fzf`.

</div>

## Demo

> [https://asciinema.org/a/432854](https://asciinema.org/a/432854)

[![asciicast](https://asciinema.org/a/432854.svg)](https://asciinema.org/a/432854)

## Features

- [x] Quickly find the packages you are looking for with fuzzy search and preview.
- [x] Uses easy-to-use APT-like subcommands
- [x] You can immediately install / uninstall the packages that you selected.
- [x] Supports Tab completion in multiple shells
    - `bash` (`bash-completion` package required)
    - `fish`
    - `zsh` (`zsh-completions` package required)

## Try fzpac

To try `fzpac` quickly, run the following command:

```bash
curl -LO git.io/fzpac && chmod +x fzpac
```

## Usage

1. Run this command
2. Select the packages with `fzf`
3. You can view the package info or install / uninstall it immediately

### Help Message

```
fzpac -- Arch Linux package finder with fzf

USAGE
    fzpac SUBCMD [KEYWORDS...]
    fzpac --help|--version

SUBCMD
    s, search        search for all available packages
    l, local         search for already installed packages
    s, install       select packages and INSTALL it
    R, remove        select packages and UNINSTALL it
    A, autoremove    select packages that are no longer needed and UNINSTALL it.
    h, help          show help message
    v, version       show version

OPTIONS
    -h, --help           show help message
    -v, --version        show version

KEY BINDINGS
    <C-j>, <C-n>  move focus down
    <C-k>, <C-p>  move focus up
    <C-s>         show information of the package
    <Tab>         select a package
    <CR>          confirm selection
```

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

then, append this commands on your `.zshrc` to activate completion.

```.zshrc
autoload -U compinit
compinit -u
```

### Install with PKGBUILD

Run below if you want to install `fzpac` with `PKGBUILD`.
After a successful installation, you can manage `fzpac` as an Arch Linux package.

```bash
# install base-devel package
sudo pacman -S --needed base-devel
# cd to some empty directory to build package
cd "$(mktemp -d)"
# download PKGBUILD file
curl -O https://raw.githubusercontent.com/sheepla/fzpac/main/aur/PKGBUILD
# build package and install
makepkg -si
```

### Install from the latest commit

Run below if you want to install `fzpac`

```bash
git clone https://github.com/sheepla/fzpac
cd fzpac
sudo make install
```

## Configuration

To change the AUR helper command to use, run fzpac with the value of the `"${FZPAC_PACMAN}"` variable set.

```bash
FZPAC_PACMAN="some-aur-helper-command" fzpac ...
```

To always use this setting, add the following line to your `~/.bashrc` or other shell rc file

```bash
export FZPAC_PACMAN="some-aur-helper-command"
```

## Contribution

Issue & PR is welcome!❤
