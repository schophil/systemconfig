PATH="$PATH:~/bin"

if [[ -d "/opt/local/bin" ]]; then
  PATH="$PATH:/opt/local/bin"
fi

if [[ -d "$HOME/.npm-global/bin" ]]; then
  PATH="$PATH:$HOME/.npm-global/bin"
fi

if [[ -d "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ]]; then
  PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fi

if [[ -d "$HOME/Library/Python/3.9/bin" ]]; then
  PATH="$PATH:$HOME/Library/Python/3.9/bin"
fi

export PATH

if [[ -f "$HOME/.sdkman/bin/sdkman-init.sh" ]]; then
  source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

if [[ -f "/opt/local/share/nvm/init-nvm.sh" ]]; then
  source "/opt/local/share/nvm/init-nvm.sh"
fi
