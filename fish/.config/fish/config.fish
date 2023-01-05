# set -x LANG "en_US.UTF-8"
# set -x LC_ALL "en_US.UTF-8"
set -x EDITOR vim

set -x EXTTRA_PATHS ~/.npm-global/bin "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ~/bin ~/.local/bin ~/tools/jmeter/bin

# set -x JAVA_HOME "temp"

set -x PATH_ORG $PATH

function compose_path
  # reset path
  set -x PATH $PATH_ORG
  # add the extras
  for extra in $EXTTRA_PATHS
    if test -d $extra
      set -x PATH $extra $PATH
    end
  end
end

alias develop "git checkout develop"
alias master "git checkout master"
alias todo "vim ~/todo.txt"
alias g "git"
alias ftags "git fetch --tags -f"

fish_vi_key_bindings
compose_path

set -e PATH_ORG

if test -f /Users/schophil/.docker/init-fish.sh
  source /Users/schophil/.docker/init-fish.sh || true
end
