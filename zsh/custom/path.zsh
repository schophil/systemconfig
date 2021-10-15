PATH="$PATH:~/bin"


if [[ -d "/opt/local/bin" ]]; then
  PATH="$PATH:/opt/local/bin"
fi

if [[ -d "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ]]; then
  PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fi

export PATH

if [[ -f "$HOME/.sdkman/bin/sdkman-init.sh" ]]; then
  source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

source "/opt/local/share/nvm/init-nvm.sh"
