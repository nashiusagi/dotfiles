#!/usr/bin/bash

set -ue

function install_delta() {
    if [[ "$(uname)" == "Darwin" ]]; then
        brew install git-delta
    else
        sudo apt install -y git-delta
    fi
}

function setup_gitconfig() {
    echo "git の user 情報を設定します"

    echo -n "Git ユーザー名: "
    read git_name
    echo -n "Git メールアドレス: "
    read git_email

    cat > ~/.gitconfig <<EOF
[user]
	name = ${git_name}
	email = ${git_email}
EOF

    cat ~/dotfiles/.gitconfig_example >> ~/.gitconfig

    echo "~/.gitconfig を作成しました"
}
