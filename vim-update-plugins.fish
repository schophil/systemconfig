#!/usr/bin/env fish
# File: vim-update-plugins.fish
# Author: Philippe Schottey

for plugin in (cat ./vim-plugins.txt)
  set -l pluginPath (string split -r -m 1 " " "$plugin")[2]
  eval "cd $pluginPath"
  git pull
end
echo done!
