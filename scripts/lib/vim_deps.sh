#!/usr/bin/bash

set -ue

function vim_deps() {
    # tagbar: 関数・クラス一覧サイドバー
    sudo apt install -y universal-ctags

    # markdown-preview.nvim: markdownプレビュー（Mermaid対応）
    vim -E -s -u NONE +"call mkdp#util#install()" +qa
}

vim_deps
