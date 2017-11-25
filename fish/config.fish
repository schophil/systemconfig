set -x JAVA_HOME "temp"
set NPM_CONFIG_PREFIX /Users/philippe/.npm-global

function setpath
  set -x PATH $JAVA_HOME/bin ~/tools/apache-ant/bin /opt/local/bin /opt/local/sbin $PATH
end

function @java8
  set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home
  set -x PATH $JAVA_HOME/bin ~/tools/apache-ant/bin /opt/local/bin /opt/local/sbin $PATH
end

function @java9
  set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk-9.jdk/Contents/Home
  set -x PATH $JAVA_HOME/bin ~/tools/apache-ant/bin /opt/local/bin /opt/local/sbin $PATH
end

@java8
