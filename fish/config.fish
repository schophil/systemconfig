set -x JAVA_HOME "temp"

if test -d ~/.npm-global/bin
	set -x PATH ~/.npm-global/bin $PATH
end

if test -d /opt/local/bin
	set -x PATH /opt/local/bin $PATH
end

if test -d /opt/local/sbin
	set -x PATH /opt/local/sbin $PATH
end

if test -d ~/tools/apache-ant/bin
	set -x PATH /~/tools/apache-ant/bin $PATH
end

function @java8
  set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_171.jdk/Contents/Home
  set -x PATH $JAVA_HOME/bin $PATH
end

function @java9
  set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk-9.jdk/Contents/Home
  set -x PATH $JAVA_HOME/bin $PATH
end

@java8
