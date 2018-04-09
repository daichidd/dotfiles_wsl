
# build vim
export PATH=$PATH:/usr/local/bin/

# gopath
export GOPATH=$HOME/go_dev/revel_sample
#export GOPATH=$HOME/go_dev/learn_echo

export PATH=$PATH:$GOPATH/bin

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
