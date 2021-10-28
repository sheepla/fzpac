<div align="center"><h1> 🔎 fzpac</h1></div>

<div align="right">
    <img src="https://img.shields.io/static/v1?label=Language&message=shell&color=blue&style=flat-square"/>
    <img src="https://img.shields.io/static/v1?label=License&message=MIT&color=blue&style=flat-square"/>
</div>

<div align="center">

`fzpac` is a `pacman` wrapper, an Arch Linux package finder with fuzzy finder.

</div>

## Demo

> [https://asciinema.org/a/432854](https://asciinema.org/a/432854)

[![asciicast](https://asciinema.org/a/432854.svg)](https://asciinema.org/a/432854)

## Features

- [x] Quickly find the packages you are looking for with **fuzzy search and preview**.
- [x] Uses easy-to-use **APT-like subcommands**.
- [x] You can immediately **install** / **uninstall** the packages that you selected.
- [x] Supports **Tab completion** in multiple shells.
    - `bash` (`bash-completion` package required)
    - `fish`
    - `zsh` (`zsh-completions` package required)
- [x] Supports **multiple AUR helpers** such as [paru](https://github.com/Morganamilo/paru) and [yay](https://github.com/Jguer/yay) .
- [x] Supports **multiple fuzzy finders** such as [fzf](https://github.com/junegunn/fzf) and [skim](https://https://github.com/lotabout/skim) .

## Try fzpac

To try `fzpac` quickly, run the following command:

```bash
curl -LO git.io/fzpac && chmod +x fzpac
```

## Usage

1. Run this command
2. Select the packages with fuzzy finder
3. You can view the package info or install / uninstall it immediately

### Help Message

```
fzpac -- Arch Linux package finder with fuzzy finder

USAGE
    fzpac SUBCMD [KEYWORDS...]
    fzpac --help|--version

SUBCMD
    s, search        search for all available packages
    l, local         search for already installed packages
    S, install       select packages and INSTALL it
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

Requires `fzf`, `sk` or your favorite fuzzy finder, but recommended one is `fzf` or `sk` to use full features.

- [junegunn/fzf](https://github.com/junegunn/fzf)
- [lotabout/skim](https://https://github.com/lotabout/skim)

If `fzf` or `sk` is not installed, install it with the following command:

```bash
sudo pacman -S fzf
# or
sudo pacman -S sk
```

If you want to use other fuzzy finder, see **FZPAC_FINDER** section in Configuration.

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

### Install with PKGBUILD (Recommend)

Run below if you want to install the latest stable version with `PKGBUILD` .
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

Run below if you want to install the latest commit version.

```bash
git clone https://github.com/sheepla/fzpac
cd fzpac
sudo make install
```

## Configurations

### FZPAC_PACMAN

To change the AUR helper command to use, run fzpac with the value of the `"${FZPAC_PACMAN}"` variable set.

This value is a colon-separated list like a `"${PATH}"` variable, elements are but commands not directories. fzpac tries to use each of the commands in `"${FZPAC_PACMAN}"` in turn as a pacman command to find packages. So fallback to following commands if the preceding one isn't found.

If no `"${FZPAC_PACMAN}"` is set or empty, fzpac assumes the value is `paru:yay:pacman`.

Note that fzpac assumes commands in `"${FZPAC_PACMAN}"` supports pacman compatible arguments. So maybe fzpac doesn't work as expected if the commands don't support them.

```bash
# Elements are command name or path.
FZPAC_PACMAN="aur-helper1:/path/to/aur-helper2:..." fzpac ...

# Precede your favorite AUR helper if you want to give priority to it.
FZPAC_FINDER="yay:paru:..." fzpac ...
```

To always use this setting, add the following line to your `~/.bashrc` or other shell rc file

```bash
export FZPAC_PACMAN="aur-helper1:/path/to/aur-helper2:..."
```

### FZPAC_FINDER

Almost the same as `"${FZPAC_PACMAN}"`, but this is to config the fuzzy finder which is used in fzpac.

If no `"${FZPAC_FINDER}"` is set or empty, fzpac assumes the value is `fzf:sk:peco:gof:fzy` .

## Contribution

Issue or PR is welcome!❤
