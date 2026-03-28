#!/usr/bin/bash

set -ue

function vim_deps() {
    # tagbar: 関数・クラス一覧サイドバー
    if [[ "$(uname)" == "Darwin" ]]; then
        brew install universal-ctags
    else
        sudo apt install -y universal-ctags
    fi

    # markdown-preview.nvim: markdownプレビュー（Mermaid対応）
    vim -E -s -u NONE +"call mkdp#util#install()" +qa
}
