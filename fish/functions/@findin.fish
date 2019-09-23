function @findin
  find . -iname $argv[1] | xargs -I z grep -l $argv[2] z
end

