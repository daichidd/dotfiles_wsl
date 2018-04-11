
# build vim
export PATH=$PATH:/usr/local/bin/
alias vi='vim'

# gopath
export GOPATH=$HOME/go_dev/

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
