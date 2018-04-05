
# gopath
export GPATH=$HOME/go_dev
export PATH=$PATH:$HOME/go_dev/bin:/usr/bin/go/bin

# goenv
export PATH="$HOME/.goenv/bin:$PATH"
eval "$(goenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
export NODEBREW_ROOT=$HOME/.nodebrew

source ~/.bashrc
