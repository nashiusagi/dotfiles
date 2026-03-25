#!/usr/bin/bash

set -ue

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

setup_gitconfig
