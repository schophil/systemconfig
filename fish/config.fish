set -x LANG "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"
set -x JAVA_HOME "temp"

# Set some things for using docker through minishift
# set -gx DOCKER_TLS_VERIFY "1";
# set -gx DOCKER_HOST "tcp://192.168.99.100:2376";
# set -gx DOCKER_CERT_PATH "/Users/philippe/.minishift/certs";

set -x PATH_ORG $PATH

set -x  EXTTRA_PATHS ~/.npm-global/bin /opt/local/bin /opt/local/sbin ~/tools/apache-ant/bin "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ~/tools/micronaut/bin ~/tools/node/bin ~/bin

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

set -x JAVA_8_PATHS /usr/lib/jvm/java-8-openjdk-amd64 /Library/Java/JavaVirtualMachines/openjdk8/Contents/Home
set -x JAVA_11_PATHS /Library/Java/JavaVirtualMachines/openjdk11/Contents/Home /usr/lib/jvm/java-11-openjdk-amd64
set -x JAVA_12_PATHS /Library/Java/JavaVirtualMachines/openjdk12/Contents/Home /usr/lib/jvm/java-12-openjdk-amd64

function @openjdk8
  compose_path
  for javap in $JAVA_8_PATHS
    if test -d $javap
      set -g -x JAVA_HOME $javap
      set -x PATH $JAVA_HOME/bin $PATH
    end
  end
end

function @openjdk11
  compose_path
  for javap in $JAVA_11_PATHS
    if test -d $javap
      set -g -x JAVA_HOME $javap
      set -x PATH $JAVA_HOME/bin $PATH
    end
  end
end

function @openjdk12
  compose_path
  for javap in $JAVA_12_PATHS
    if test -d $javap
      set -g -x JAVA_HOME $javap
      set -x PATH $JAVA_HOME/bin $PATH
    end
  end
end

# @oraclejdk8j
@openjdk12

fish_vi_key_bindings
compose_path
