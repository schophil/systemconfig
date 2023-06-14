alias start-ssh-agent='eval $(ssh-agent -s)'
alias todo='vim ~/todo.txt'
alias aiv='cd ~/w_aiv'
alias updateports='sudo port selfupdate && sudo port upgrade outdated'
alias mvntree='mvn dependency:tree'
alias afterwincopy='find . -type f -print0 | xargs -0 -I f chmod a-x,g+rw,o-w f'
alias branches='git -P branch'

# git aliases
alias develop='git checkout develop'
alias master='git checkout master'
alias branch='git checkout -b'
alias gitaivconfig='git config --local user.email "philippe.schottey@vlaanderen.be" && git config --local user.name "Philippe Schottey"'
alias gitdefconfig='git config --local user.email "schophil@icloud.com" && git config --local user.name "Philippe Schottey"'
