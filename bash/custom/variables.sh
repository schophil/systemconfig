EDITOR='nano'
MAN_POSIXLY_CORRECT=1
export NOTES_EDITOR NOTES_HOME EDITOR MAN_POSIXLY_CORRECT

PATH=~/.local/bin:$PATH
export PATH

if uname -r | grep -q 'microsoft'; then
	if [ -z "$SSH_AGENT_PID" ]; then
		echo 'Starting ssh agent'
		start-ssh-agent
	else
		echo 'SSH agent already running on ' $SSH_AGENT_PID
	fi
	#export BROWSER=/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe
fi