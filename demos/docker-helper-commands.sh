alias dcleanimgs='docker rmi $(docker images -a --filter=dangling=true -q)'
alias dcleanps='docker rm $(docker ps --filter=status=created --filter=status=exited -q)'