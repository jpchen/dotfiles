source ~/.rvm/scripts/rvm
PATH=/usr/local/bin:$PATH
source ~/.bashrc

#so 256 colors work on tmux
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
          else
                  export TERM='screen-256color'
                    fi


. /Users/jpchen/torch/install/bin/torch-activate
