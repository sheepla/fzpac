# fzpac

Arch Linux package finder with fzf

<image src="./img/screenshot.png" width="70%">

## Usage

When you run the command, the preview pane displays detailed package information and a list of files.
Type keywords to narrow down your choices.
Press `Ctrl+j` / `Ctrl+k` or `Ctrl+n` / `Ctrl+p` or cursor key to select the package.
You can also select multiple packages by pressing the `Tab` key.
Press `Enter` to confirm your selection.

```
$THIS_CMD -- Arch Linux package finder with fzf

USAGE
    $THIS_CMD SUBCMD KEYWORDS...

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

Require `fzf`.

<a href="https://github.com/junegunn/fzf">junegunn/fzf</a>

```bash
# If you don't have installed fzf...
sudo pacman -S fzf
```

Just download and add execution permission.

```bash
# wget
wget https://raw.githubusercontent.com/sheepla/fzpac/main/fzpac && chmod +x fzpac

# curl
curl -O https://raw.githubusercontent.com/sheepla/fzpac/main/fzpac && chmod +x fzpac
```

