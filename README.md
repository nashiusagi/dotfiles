# dotfiles
dotfiles1年生が夜なべしてつくっている

## 構成

```
dotfiles/
├── .vimrc                    # Vim設定（エントリーポイント）
├── .vim/
│   ├── base.vim              # Vimの基本設定
│   ├── plugin.vim            # Vundleプラグイン管理
│   ├── style.vim             # 表示・スタイル設定
│   ├── coc-settings.json     # coc.nvimのJSON設定
│   └── myplugin-config/
│       ├── coc.vim           # coc.nvimのキーマップ設定
│       └── nerd.vim          # NERDTreeの設定
├── .zshrc                    # Zsh設定（エントリーポイント）
├── .zshenv                   # Zsh環境変数
├── .p10k.zsh                 # Powerlevel10kテーマ設定
├── .zsh/
│   └── zshrc/
│       ├── alias.zsh         # エイリアス定義
│       ├── base.zsh          # 基本設定・プロンプト
│       ├── plugin.zsh        # zplugプラグイン管理
│       └── option.zsh        # Zshオプション設定
├── .tmux.conf                # tmux設定（エントリーポイント）
├── .tmux/
│   ├── base.tmux             # 基本設定
│   ├── bind.tmux             # キーバインド
│   ├── plugin.tmux           # プラグイン
│   └── style.tmux            # スタイル設定
├── .wezterm.lua              # WezTerm設定（エントリーポイント）
├── .wezterm/
│   ├── keybinds.lua          # キーバインド設定
│   └── utils.lua             # ユーティリティ関数
├── .fonts/                   # カスタムフォント
├── .gitignore
└── scripts/                  # インストールスクリプト
    ├── install.sh            # 通常インストール
    ├── install_for_server.sh # サーバー用インストール（sudo不要）
    └── lib/
        ├── powerline.sh      # Powerlineインストール
        └── zplug.sh          # zplugインストール
```

## 依存関係

- **Git**: バージョン管理
- **Python3 + pip**: Powerline用
- **Node.js**: coc.nvim用
- **Yarn**: coc.nvimのビルド用
