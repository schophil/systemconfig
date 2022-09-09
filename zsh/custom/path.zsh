PATH="$HOME/bin:$PATH"

if [[ -d "/opt/local/bin" ]]; then
  PATH="/opt/local/bin:$PATH"
fi

if [[ -d "$HOME/.npm-global/bin" ]]; then
  PATH="$HOME/.npm-global/bin:$PATH"
fi

if [[ -d "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ]]; then
  PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
fi

if [[ -d "$HOME/Library/Python/3.9/bin" ]]; then
  PATH="$HOME/Library/Python/3.9/bin:$PATH"
fi

export PATH

if [[ -f "$HOME/.sdkman/bin/sdkman-init.sh" ]]; then
  source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

if [[ -f "/opt/local/share/nvm/init-nvm.sh" ]]; then
  source "/opt/local/share/nvm/init-nvm.sh"
fi
