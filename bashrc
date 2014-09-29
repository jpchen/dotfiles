export TERM=xterm-256color
export EDITOR=vim
export BASH_ENV=~/.bash_env
#aliases
#alias ipython='nobanner -noconfirm_exit'
alias tmux="tmux -2"
alias grep='grep --color=auto'
alias eniac='ssh jonchen@eniac.seas.upenn.edu'
alias la='ls -lha'
alias dolphin='sftp jonchen@origin.www.upenn.edu'
alias ...='../..'
alias mv='mv -i'
alias lscol='ls | lolcat'
alias ..='cd ..'
alias speclab='ssh speclab.seas.upenn.edu'
alias rm='rm -i'
alias rmdir='rmdir -i'

#logs from pdflatex
cleantex () {
    rm -f *.aux
    rm -f *.log
    echo done
}

#tweet from commandline
tweet(){
    curl -u user:pass -d status="$1" http://twitter.com/statuses/update.xml
}


#extract archives
extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)   tar xvjf $1    ;;
			*.tar.gz)    tar xvzf $1    ;;
			*.bz2)       bunzip2 $1     ;;
			*.rar)       unrar x $1      ;;
			*.gz)        gunzip $1      ;;
			*.tar)       tar xvf $1     ;;
			*.tbz2)      tar xvjf $1    ;;
			*.tgz)       tar xvzf $1    ;;
			*.zip)       unzip $1       ;;
			*.Z)         uncompress $1  ;;
			*.7z)        7z x $1        ;;
			*)           echo "don't know how to extract '$1'..." ;;
			 esac
		 else
			 echo "'$1' is not a valid file!"
		 fi
	 }
	
source ~/.rvm/scripts/rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

function today {
    echo "Today's date is:"
        date +"%A, %B %-d, %Y"
    }
