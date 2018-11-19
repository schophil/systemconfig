set -x LANG "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"
set -x JAVA_HOME "temp"

# alias ssh /usr/bin/ssh
# alias scp /usr/bin/scp
# alias ssh-add /usr/bin/ssh-add

set -x PATH_ORG $PATH

set -x  EXTTRA_PATHS ~/.npm-global/bin /opt/local/bin /opt/local/sbin ~/tools/apache-ant/bin "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ~/tools/minishift

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

function @java8
  compose_path
  set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_171.jdk/Contents/Home
  set -x PATH $JAVA_HOME/bin $PATH
end

function @java10
  compose_path
  set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk-10.0.1.jdk/Contents/Home
  set -x PATH $JAVA_HOME/bin $PATH
end

function @java11
  compose_path
  set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk-11.0.1.jdk/Contents/Home
  set -x PATH $JAVA_HOME/bin $PATH
end

@java11

fish_vi_key_bindings

