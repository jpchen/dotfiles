# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
export PATH=$PATH:$HOME/anaconda/bin # conda
export PATH=$PATH:$HOME/.opus/bin # opus
export PATH=$PATH:/usr/local/opt/openssl/bin #opencv/cv2 stuff
export PATH=$PATH:/usr/local/sbin/
export PYTHONPATH=$PYTHONPATH:/Users/jpchen/Uber/pyro # run pyro locally
export DYLD_LIBRARY_PATH=/Users/jpchen/torch/pkg/torch/build/lib/TH/libTH.dylib:/Users/jpchen/torch/install/lib/libTH.dylib:/Users/jpchen/torch/pkg/torch/lib/TH/libmTH.dylib
export TERM=xterm-256color
export EDITOR=vim

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
# prepend %{$fg_bold[white]%}%M
# in ~/.oh-my.zsh/themes/robbyrussell.zsh-theme
# for ssh machines to show machine name

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

#make command backsapce delete left of cursor in iterm
# map to 0x18 0x7f
bindkey "^X\\x7f" backward-kill-line

## history
setopt APPEND_HISTORY
## for sharing history between zsh processes
setopt INC_APPEND_HISTORY
# setopt SHARE_HISTORY

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
alias igrep='grep --color=auto -i --exclude-dir=node_modules'
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
alias ifind='find . -iname'
alias clean='ifind "*~" -type f -delete -o -name "*.swp" -type f -delete -o -name "*.pyc" -type f -delete'
alias more='less'
alias irc='irssi'
alias ks='ls'
alias vun='vim'
alias pgrep='pgrep -f'
alias cleanup='ifind "*~" -type f -delete; ifind "*.swp.*" -type f -delete' 
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
alias mic="sudo kill -9 `ps ax|grep 'coreaudio[a-z]' | awk '{print $1}'`"
alias finder='sudo killall Finder'
alias stfu='defaults write com.apple.PowerChime ChimeOnAllHardware -bool false;killall PowerChime'
alias visdom='python -m visdom.server'
alias jupno='jupyter notebook'
alias jupconv='jupyter nbconvert --to'
# https://gist.github.com/MohamedAlaa/2961058
alias tnew='tmux new -s'
alias tkill='tmux kill-session -t'

# Conda
# https://conda.io/docs/using/pkgs.html
alias c='conda'
alias cenv='conda env list'
alias clist='conda list'
# for py3, "ccreate -n name python=3.6"
alias ccreate='conda create -n'
alias cinstall='conda install'
alias crm='conda env remove -n'
alias cenvrm='conda env remove -n'
alias activate='deactivate; source activate'
alias deactivate='source deactivate'
#virtualenv
alias venv='virtualenv'
# alias activate='source .venv/bin/activate'
cclone () {
  if [ $# -lt 2 ]
  then
    echo "cclone newenv oldenv"
    return
  fi
  conda create --name "$1" --clone "$2"; activate "$1"
}


# Uber
alias uber='cd /Users/jpchen/Uber'
alias pyro='cd /Users/jpchen/Uber/pyro'
alias iei='cd /Users/jpchen/Uber/iei/pyro-apps/iei'
alias ig='cd /Users/jpchen/Uber/iei/pyro-apps/ig'
alias mani='cd /Users/jpchen/Uber/manifold'
alias testall='pyro; python -m unittest discover -v'
alias testdist='pyro; python -m unittest -v tests.test_distributions'
alias testinf='pyro; python -m unittest -v tests.test_inference'
# allows git ssh without pw
alias ugit='ssh-add -A'
alias m='mosh anton'
alias anton='ssh anton'
alias antongui='ssh -X anton'
alias discourse='ssh -i ~/aws_keypair_pyro.pem bitnami@18.221.63.130'
ssh-port () {
  ssh -nNT -L "$1":localhost:8888 anton
}
alias mvim='vim' #some fucking uber arc bullshit script

#Git
alias gb='git branch'
alias gc='git checkout'
alias gac='git add -A .; git commit -am'
alias gs='git status'
alias gd='git diff'
# diff between last two commits
alias gsh='git show'
alias amend='git commit --amend'
alias undo='git reset --soft HEAD~'
# deletes commit and changes in working tree.
alias rollback='git reset --hard'
alias cleanws='git clean -fd'
alias lg='git lg'
alias gl='git log'
# undo last commit, does not touch working tree.
alias gpop='git reset HEAD~'
# undo previous command
alias gundo='git reset "HEAD@{1}"'
# revert uncommitted/unstaged changes for one file/path
alias revert='git checkout --'
alias gprune=' git fetch --all --prune'
alias gsyncm='git fetch upstream; git checkout master && git merge upstream/master'
alias syncwppl='git fetch upstream; git checkout master && git merge upstream/dev'

#compare current branch with remote branch
compare () {
  branch=$(git branch | grep "\*" | cut -c 3-)
  git diff origin/$branch $branch
}

loop () {
  if [ $# -lt 2 ]
  then
      echo "loop i [command]"
      return
  fi
  for i in {1.."$1"}; do "${@:2}"; done
}

fnd () {
    ifind "*$1*"
}

dudir () {
  (
  for d in *
  do
      sudo du -hs $d
  done
  ) | gsort -h
}

replace() {
# recursively replace string 1 with string 2
  if [ $# -lt 2 ]
  then
      echo "replace arg1 with arg2 in all python files recursively"
      return
  fi
  LC_CTYPE=C LANG=C find . -type f -name '*.py' -exec sed -i '' s/$1/$2/ {} +
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


# . /Users/jpchen/torch/install/bin/torch-activate


# =======
# UBER
# ======
export UBER_LDAP_UID=jpchen
export UBER_HOME=/home/jpchen/Uber
export UBER_EMAIL=jpchen@uber.com
export UBER_OWNER=jpchen@uber.com
export VAGRANT_DEFAULT_PROVIDER=aws
alias qs='quicksilver'
alias kill-opus-tunnels="ps aux | grep 'ssh -fN' | grep -v grep | awk '{print \$2}' | xargs -I {} kill {}; ps aux | grep 'ssh -D 8127 -f -C' | grep -v grep | awk '{print \$2}' | xargs -I {} kill {}"
alias opus-tunnels="kill-opus-tunnels; ussh -D 8127 -f -C -q -N bastion02-sjc1; ussh -fNL 5000:localhost:5000 opusprod830-wbu2; ssh -fNL 4587:artifactory.uber.internal:4587 bastion01-sjc1; ssh -fN -i ~/.docker/machine/machines/default/id_rsa -R 5000:localhost:5000 docker@\`docker-machine ip default\`"
alias opusbox='ssh opuscpu15-wbu2'
alias opusroot='ssh -A -o StrictHostKeyChecking=no -p 31021 root@opusgpu86-wbu2'


# HADOOP
export HADOOP_VERSION=3.1.1
export HADOOP_PREFIX=/usr/local/Cellar/hadoop/$HADOOP_VERSION/libexec
export HADOOP_HOME=$HADOOP_PREFIX
export HADOOP_CONF_DIR=$HADOOP_PREFIX/etc/hadoop/
export PATH=$HADOOP_HOME/bin:$PATH

#JAVA
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$JAVA_HOME/bin:$PATH

brew analytics off 2>&1 >/dev/null

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jpchen/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/jpchen/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jpchen/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/jpchen/google-cloud-sdk/completion.zsh.inc'; fi
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
source /usr/local/etc/bash_completion.d/opus_command_completion
source /Users/jpchen/.opus/conf/opus_profile
