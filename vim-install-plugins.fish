#!/opt/local/bin/fish
# File: vim-install-plugins.fish
# Author: Philippe Schottey

for plugin in (cat ./vim-plugins.txt)
  set -l pluginData (string split -r -m 1 " " "$plugin")
  set -l pluginUrl $pluginData[1]
  set -l pluginPath $pluginData[2]
  if eval "test -d $pluginPath"
    echo "Already installed $pluginUrl"
  else
    eval "git clone $plugin"
  end
  echo done!
end
