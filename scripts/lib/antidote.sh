#!/usr/bin/bash

set -ue

function install_antidote(){
    git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote
}

function install_fzf(){
    sudo apt install -y fzf
}

install_antidote
install_fzf
