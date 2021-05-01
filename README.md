# fzpac

*fzpac* is an Arch Linux package finder with `fzf`.
You can quickly find a package to see its detailed information and install / uninstall it.

<image src="./img/screenshot.png" width="70%">


## Usage

When you run the command, the preview pane displays detailed package information and a list of files.
Type keywords to narrow down your choices.
Press `Ctrl+j` / `Ctrl+k` or `Ctrl+n` / `Ctrl+p` or cursor key to select the package.
You can also select multiple packages by pressing the `Tab` key.
Press `Enter` to confirm your selection.

```
fzpac -- Arch Linux package finder with fzf

USAGE
    fzpac SUBCMD KEYWORDS...

SUBCMD
    s, select        Search for and select all available packages.
                     * pacman -Ssq -> fzf
    q, select-local  Search for and select installed packages.
                     * pacman -Qsq -> fzf

    i, info          Search for all available packages,
                     and show detail information that you selected.
                     * pacman -Ssq -> fzf -> pacman -Sii
    l, info-local    Same as [info], but searches for installed packages.
                     instead of all available packages.
                     * pacman -Qsq -> fzf -> pacman -Qil

    p, view          Search for all available packages,
                     and browse the details of the selected one using less pager.
                     * pacman -Ssq -> fzf <--> pacman -Sii|less
    v, view-local    Savem as [view], but searches for installed packages
                     instead of all available packages.
                     * pacman -Qsq -> fzf <--> pacman -Qil|less

    S, install       Select packages and install that you selected.
                     * pacman -Ssq -> fzf -> sudo pacman -S
    R, remove        Select packages and uninstall that you selected.
                     * pacman -Qsq -> fzf -> sudo pacman -Rn

    h, help          Show this usage.
    V, version       Show version.
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

If you have the following AUR helpers installed, `fzpac` will use that command in preference to pacman.

<ul>
    <li><a href="https://github.com/Jguer/yay">Jguer/yay</a></li>
    <li><a href="https://github.com/Morganamilo/paru">Morganamilo/paru</a></li>
</ul>

### Install

Just download `fzpac` and add execution permission.

```bash
# wget
wget https://raw.githubusercontent.com/sheepla/fzpac/main/fzpac && chmod +x fzpac

# curl
curl -O https://raw.githubusercontent.com/sheepla/fzpac/main/fzpac && chmod +x fzpac
```

