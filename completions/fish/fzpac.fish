complete -c fzpac -x

complete -c fzpac -n '__fish_use_subcommand' -x -a 's select' -d 'SEARCH FOR: all available packages'
complete -c fzpac -n '__fish_use_subcommand' -x -a 'q select-local' -d 'SEARCH FOR: already installed packages'
complete -c fzpac -n '__fish_use_subcommand' -x -a 'i info' -d 'SEARCH FOR: all available packages'
complete -c fzpac -n '__fish_use_subcommand' -x -a 'l info-local' -d 'SEARCH FOR: already installed packages'
complete -c fzpac -n '__fish_use_subcommand' -x -a 'b browse' -d 'SEARCH FOR: all available packages'
complete -c fzpac -n '__fish_use_subcommand' -x -a 'v browse-local' -d 'SEARCH FOR: already installed packages'
complete -c fzpac -n '__fish_use_subcommand' -x -a 'S install' -d 'Select packages and INSTALL it.'
complete -c fzpac -n '__fish_use_subcommand' -x -a 'R remove' -d 'Select packages and UNINSTALL it.'
complete -c fzpac -n '__fish_use_subcommand' -x -a 'A autoremove' -d 'Select packages that are no longer needed and UNINSTALL it.'
complete -c fzpac -n '__fish_use_subcommand' -x -a 'h help' -d 'Show this usage.'
complete -c fzpac -n '__fish_use_subcommand' -x -a 'V version' -d 'Show version.'
