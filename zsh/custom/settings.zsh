# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr
#
check-ssh-agent() {
    if uname -r | grep -q 'microsoft'; then
        echo "This is wsl!"

        # Making sure ssh-agent is running
        if [[ -z "$SSH_AGENT_PID" ]]; then
            if [[ -e "/tmp/schophil-ssh-agent" ]]; then
                echo "Restoring env from backup file"
                source /tmp/schophil-ssh-agent
            else
                echo "Starting ssh agent"

                eval "$(ssh-agent -s)"

                echo "Creating backup file"
                {
                    echo "export SSH_AGENT_PID=$SSH_AGENT_PID"
                    echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK"
                } > /tmp/schophil-ssh-agent
            fi
        else
            echo "SSH agent already running on $SSH_AGENT_PID"
        fi

        # other wsl/windows specific stuff
        #
    fi
}

export EDITOR=vim

bindkey "^B" backward-word
bindkey "^F" forward-word

check-ssh-agent;

export M2_HOME=/home/schophil/.sdkman/candidates/maven/current

# ZSH_THEME="sunrise"
ZSH_THEME="lukerandall"
