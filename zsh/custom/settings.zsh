# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr
#
bindkey "^B" backward-word
bindkey "^F" forward-word

# ZSH_THEME="museplusplus"
ZSH_THEME="aussiegeekplusplus"

if uname -r | grep -q 'microsoft'; then
	if [ -z "$SSH_AGENT_PID" ]; then
		echo 'Starting ssh agent'
		start-ssh-agent
	fi
fi
