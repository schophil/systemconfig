EDITOR='nano'
MAN_POSIXLY_CORRECT=1
export NOTES_EDITOR NOTES_HOME EDITOR MAN_POSIXLY_CORRECT

PATH=~/.local/bin:$PATH
export PATH

if uname -r | grep -q 'microsoft'; then
	if [ -z "$SSH_AGENT_PID" ]; then
		if [[ -e "/tmp/schophil-ssh-agent" ]]; then
			echo "Restoring env from backup file"
			source /tmp/schophil-ssh-agent
		else 
			echo 'Starting ssh agent'
			start-ssh-agent
			echo 'Creating backup file'
			echo "export SSH_AGENT_PID=$SSH_AGENT_PID" > /tmp/schophil-ssh-agent
			echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK" >> /tmp/schophil-ssh-agent
		fi
	else
		echo 'SSH agent already running on ' $SSH_AGENT_PID
	fi
	#export BROWSER=/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe
fi