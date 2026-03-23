#!/usr/bin/bash

set -ue

function install_fzf() {
    if command -v fzf &> /dev/null; then
        echo "fzf is already installed."
        return 0
    fi

    # apt でインストールを試みる
    if command -v apt &> /dev/null; then
        echo "Installing fzf via apt..."
        sudo apt update && sudo apt install -y fzf
        return 0
    fi

    # apt が使えない場合は git clone でインストール
    echo "Installing fzf via git..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
}

install_fzf
