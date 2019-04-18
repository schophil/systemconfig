function @findinjava
  find . -iname '*.java' | xargs -I z grep -l $argv z
end
