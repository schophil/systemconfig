set -x JAVA_HOME "temp"
set -x PATH ~/.npm-global/bin $PATH

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
