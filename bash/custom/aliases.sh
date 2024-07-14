alias todo='vim ~/Documents/todo.txt'
alias start-ssh-agent='eval $(ssh-agent -s)'
alias afterwincopy='find . -type f -print0 | xargs -0 -I f chmod a-x,g+rw,o-w f'

# git aliases
alias g='git'
alias stash='git stash -u'
alias branches='git -P branch'
alias develop='git checkout develop'
alias master='git checkout master'
alias branch='git checkout -b'
alias gitaivconfig='git config --local user.email "philippe.schottey@vlaanderen.be" && git config --local user.name "Philippe Schottey"'
alias gitdefconfig='git config --local user.email "schophil@icloud.com" && git config --local user.name "Philippe Schottey"'
alias main='git checkout main'

# maven aliases
alias mtree='./mvnw dependency:tree'
alias minstall='./mvnw -U clean install'
alias mtest='./mvnw clean test'

# my php tools
alias rrngen='php $HOME/systemconfig/tools/php/generate_rrn.php'
alias tokendecode='php $HOME/systemconfig/tools/php/base64decode.php --token'
alias base64decode='php $HOME/systemconfig/tools/php/base64decode.php'

# AIV specific stuff
alias awstools='docker run --rm -ti -v ~/.aws:/root/.aws mbp/aws'
