complete -c fzpac -x

complete -c fzpac -n '__fish_use_subcommand' -x -a 's select'        -d 'search for all available packages'
complete -c fzpac -n '__fish_use_subcommand' -x -a 'sl select-local' -d 'search for already installed packages'
complete -c fzpac -n '__fish_use_subcommand' -x -a 'i info'          -d 'show info of the package that you selected'
complete -c fzpac -n '__fish_use_subcommand' -x -a 'il info-local'   -d 'show info of the package that you selected (search for already installed)'
complete -c fzpac -n '__fish_use_subcommand' -x -a 'b browse'        -d 'browse the packages'
complete -c fzpac -n '__fish_use_subcommand' -x -a 'bl browse-local' -d 'browse the packages (search for already installed)'
complete -c fzpac -n '__fish_use_subcommand' -x -a 'S install'       -d 'select the packages and INSTALL it'
complete -c fzpac -n '__fish_use_subcommand' -x -a 'R remove'        -d 'select the packages and UNINSTALL it'
complete -c fzpac -n '__fish_use_subcommand' -x -a 'A autoremove'    -d 'select the packages that are no longer needed and UNINSTALL it'
complete -c fzpac -n '__fish_use_subcommand' -x -a 'h help'          -d 'show help message'
complete -c fzpac -n '__fish_use_subcommand' -x -a 'V version'       -d 'show version'
