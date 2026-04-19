#!/usr/bin/bash

set -ue

function install_antidote(){
    git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote
}

function install_fzf(){
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
}

install_antidote
install_fzf
