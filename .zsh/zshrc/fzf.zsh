# fzf の設定
# fzf がインストールされている場合のみ設定を読み込む

if command -v fzf &> /dev/null; then
    # fzf のキーバインド・補完を読み込む
    # apt install fzf の場合
    if [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
        source /usr/share/doc/fzf/examples/key-bindings.zsh
    fi
    if [[ -f /usr/share/doc/fzf/examples/completion.zsh ]]; then
        source /usr/share/doc/fzf/examples/completion.zsh
    fi

    # git clone でインストールした場合
    if [[ -f ~/.fzf.zsh ]]; then
        source ~/.fzf.zsh
    fi

    # fzf のデフォルトオプション
    export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

    # Ctrl+R: 履歴をインタラクティブにファジー検索
    # Ctrl+T: カレントディレクトリ以下のファイルをファジー検索
    # Alt+C: ディレクトリをファジー検索して即移動
fi
