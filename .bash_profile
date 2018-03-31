
export GOROOT=/usr/bin/go
export GOPATH=/home/daichi/dev_go
export PATH=$PATH:$GOPATH/bin
export PATH=$GOROOT/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH=$HOME/.nodebrew/current/bin:$PATH
export NODEBREW_ROOT=$HOME/.nodebrew
nodebrew use v8.10.0

source ~/.bashrc
