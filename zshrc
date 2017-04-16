# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
DYLD_LIBRARY_PATH=/Users/jpchen/torch/pkg/torch/build/lib/TH/libTH.dylib:/Users/jpchen/torch/install/lib/libTH.dylib:/Users/jpchen/torch/pkg/torch/lib/TH/libmTH.dylib:/Volumes/256GHD/Work/paultorchjs/torch.js/thlib/libmTH.dylib
export TERM=xterm-256color
export EDITOR=vim

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

autoload -U compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP
#emacs key bindings
bindkey -e

## history
setopt APPEND_HISTORY
## for sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

autoload -U colors
#colors

#aliases
alias tmux="tmux -2"
alias igrep='grep --color=auto -i'
alias eniac='ssh jonchen@eniac.seas.upenn.edu'
alias dolphin='sftp jonchen@origin.www.upenn.edu'
alias speclab='ssh jonchen@speclab.seas.upenn.edu'
alias cleantex='clean; rm -f *.aux; rm -f *.log; rm -f *.out'
alias ...='../..'
alias ..='cd ..'
alias rm='rm -i'
alias ltr='ls -ltr'
alias la='ls -a'
alias zshrc='source ~/.zshrc'
alias find='find . -iname'
alias clean='find "*~" -type f -delete -o -name "*.swp" -type f -delete'
alias more='less'
alias irc='irssi'
alias ks='ls'
alias vun='vim'
alias pgrep='pgrep -f'
alias cleanup='find "*~" -type f -delete; find "*.swp.*" -type f -delete' 
alias hd='cd /Volumes/256GHD'
alias work='cd /Volumes/256GHD/Work'
alias neo='cd /Volumes/256GHD/neoDownloads/'
alias pokerun='cd /Users/jpchen/pokego-bot; ./run.sh 2> >( tee /dev/stderr | grep --line-buffered pokemon_caught >> out )'
alias wp='webppl'
alias wpdev='~/webppl/webppl/webppl'
alias wpv='webppl --require webppl-viz'
alias update='git pull https://github.com/probmods/webppl.git'
alias chrome='open -a "Google Chrome"'
alias size='du -hs'
alias vd='vim -d'
alias jeklo='jekyll build; jekyll serve --config _config_dev.yml --watch'
# alias mic='sudo killall coreaudiod'
alias finder='sudo killall Finder'

#Git
alias gb='git checkout'
alias gc='git add -A .; git commit -am'
alias gs='git status'
alias gd='git diff'
alias amend='git commit --amend'
alias undo='git reset --soft HEAD~'
alias rollback='git reset --hard'
alias cleanws='git clean -fd'
alias cleanws='git clean -fd'
alias lg='git lg'
alias gl='git log'
alias gsyncm='git fetch upstream; git checkout master && git merge upstream/master'
alias syncwppl='git fetch upstream; git checkout master && git merge upstream/dev'

#compare current branch with remote branch
compare () {
  branch=$(git branch | grep "\*" | cut -c 3-)
  git diff $branch origin/$branch
}

loop () {
  if [ $# -lt 2 ]
  then
      echo "loop i [command]"
  fi
  for i in {1.."$1"}; do "${@:2}"; done
}

fnd () {
    find "*$1*"
}

dudir () {
  (
  for d in *
  do
      du -hs $d
  done
  ) | gsort -h
}

flush() {
#wipe a certain type of file from current directory
  rm -f *.$1 
}

## Extract Archives
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjvf $1    ;;
      *.tar.gz)    tar xzvf $1    ;;
      *.bz2)       bzip2 -d $1    ;;
      *.rar)       unrar x $1    ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1    ;;
      *.tgz)       tar xzf $1    ;;
      *.zip)       unzip2dir $1     ;;
      *.Z)         uncompress $1    ;;
      *.7z)        7z x $1    ;;
      *.ace)       unace x $1    ;;
      *)           echo "'$1' cannot be extracted via extract()"   ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

## IP Info ##
ipinfo() { 
    if grep -P "(([1-9]\d{0,2})\.){3}(?2)" <<< "$1"; then
    curl ipinfo.io/"$1"
    else
    ipawk=($(host "$1" | awk '/address/ { print $NF }'))
    curl ipinfo.io/${ipawk[1]}
    fi
    echo
}

## Note taker ##
note () {
    # if file doesn't exist, create it
    if [[ ! -f $HOME/.notes ]]; then
        touch "$HOME/.notes"
    fi

    if ! (($#)); then
        # no arguments, print file
        cat "$HOME/.notes"
    elif [[ "$1" == "-c" ]]; then
        # clear file
        printf "%s" > "$HOME/.notes"
    else
        # add all arguments to file
        printf "%s\n" "$*" >> "$HOME/.notes"
    fi
}

## mkdir and cd ##
mkcd () {
  mkdir -p $1 && cd $1
}

encrypt () {
    # Usage: zip -er [file.zip] files
    zip -er $@
}

jrun () {
  str=
  for i in "$@"; do
    str="$str $i.java"
  done
  javac $1.java && java $1
}

copy () {
  pbcopy < $1
}

dim () {
#!/usr/bin/env bash

filename=$1

if [ ! -f "$filename" ] ; then
    echo "$filename not found!";
    exit 1
fi

w=$( sips -g pixelWidth "$filename" | tail -n1 | cut -d" " -f4 )
h=$( sips -g pixelHeight "$filename" | tail -n1 | cut -d" " -f4 )

echo "width: $w"
echo "height: $h"
# To display in Finder notification, uncomment below
#osascript -e "tell application \"Finder\" to {activate, display alert \"$filename\\nWidth: $w\\nHeight: $h\"}"
}

chpwd() ls


. /Users/jpchen/torch/install/bin/torch-activate
