complete -c fzpac -x

complete -c fzpac -n '__fish_use_subcommand' -x -a 's select' -d 'search for all available packages'
complete -c fzpac -n '__fish_use_subcommand' -x -a 's search' -d 'search for all available packages'
complete -c fzpac -n '__fish_use_subcommand' -x -a 'l local' -d 'search for already installed packages'
complete -c fzpac -n '__fish_use_subcommand' -x -a 's install' -d 'select packages and INSTALL it'
complete -c fzpac -n '__fish_use_subcommand' -x -a 'R remove' -d 'select packages and UNINSTALL it'
complete -c fzpac -n '__fish_use_subcommand' -x -a 'A autoremove' -d 'select packages that are no longer needed and UNINSTALL it'
complete -c fzpac -n '__fish_use_subcommand' -x -a 'h help' -d 'show help message'
complete -c fzpac -n '__fish_use_subcommand' -x -a 'v version' -d 'show version'
