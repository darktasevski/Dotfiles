
if [[ `uname` == 'Linux' ]]; then
	# Start X at login for Arch boxes
	if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]] ; then
		if hash startx 2>& /dev/null; then
			startx && logout
		fi	
	fi
fi

export EDITOR='vim'
export TERM="xterm-256color"
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -s "$NVM_DIR/bash_completion" ]] && \. "$NVM_DIR/bash_completion"

# Point to Yarn global installs
export PATH="$PATH:$(yarn global bin)"

# Golang
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"
export PATH=$PATH:$GOPATH/bin

#https://github.com/keybase/keybase-issues/issues/2798
export GPG_TTY=$(tty)

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

# no lag on normal / insert mode switch   # see http://dougblack.io/words/zsh-vi-mode.html
export KEYTIMEOUT=1

export GREP_COLOR='00;1;31'

# Always enable colored `grep` output.
export GREP_OPTIONS='--color=auto';

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'