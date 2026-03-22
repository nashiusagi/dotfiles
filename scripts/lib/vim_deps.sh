#!/usr/bin/bash

set -ue

function vim_deps() {
    # tagbar: 関数・クラス一覧サイドバー
    sudo apt install -y universal-ctags

    # vim-instant-markdown: markdownプレビュー
    npm install -g instant-markdown-d
}

vim_deps
