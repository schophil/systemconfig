function @vimlast --description "Edit the last file of ls|sort"
  vim (ls $argv | sort | tail -n 1)
end
