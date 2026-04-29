# dotfiles
dotfiles1年生が夜なべしてつくっている

## 構成

```
dotfiles/
├── .config/
│   └── nvim/                     # Neovim設定（lazy.nvim）
│       ├── init.lua              # エントリーポイント
│       ├── lazy-lock.json        # プラグインバージョンロック
│       └── lua/
│           ├── config/
│           │   ├── autocmds.lua  # オートコマンド
│           │   ├── keymaps.lua   # キーマップ
│           │   └── options.lua   # 基本オプション
│           └── plugins/
│               ├── editor.lua    # 編集補助プラグイン
│               ├── git.lua       # Git連携（fugitive, gitsigns）
│               ├── lang.lua      # 言語サポート
│               ├── lsp.lua       # LSP設定
│               ├── search.lua    # 検索（fzf, ripgrep）
│               └── ui.lua        # UI（lualine, カラースキーム等）
├── .zshrc                        # Zsh設定（エントリーポイント）
├── .zshenv                       # Zsh環境変数
├── .p10k.zsh                     # Powerlevel10kテーマ設定
├── .zsh/
│   └── zshrc/
│       ├── alias.zsh             # エイリアス定義
│       ├── base.zsh              # 基本設定・プロンプト
│       ├── plugin.zsh            # antidoteプラグイン管理
│       └── option.zsh            # Zshオプション設定
├── .tmux.conf                    # tmux設定（エントリーポイント）
├── .tmux/
│   ├── base.tmux                 # 基本設定
│   ├── bind.tmux                 # キーバインド
│   ├── plugin.tmux               # プラグイン
│   └── style.tmux                # スタイル設定
├── .wezterm.lua                  # WezTerm設定（エントリーポイント）
├── .wezterm/
│   ├── keybinds.lua              # キーバインド設定
│   └── utils.lua                 # ユーティリティ関数
├── .fonts/                       # カスタムフォント
├── .gitignore
├── docs/                         # 各ツールのドキュメント
│   ├── git.md
│   ├── tmux.md
│   ├── vim.md
│   ├── wezterm.md
│   └── zsh.md
└── scripts/                      # インストールスクリプト
    ├── install.sh                # 通常インストール
    ├── install_for_server.sh     # サーバー用インストール（sudo不要）
    ├── install_mac.sh            # Mac用インストール
    ├── setup_wezterm_ime.sh      # WezTerm IME設定
    ├── zsh_profile.sh            # Zshプロファイル設定
    └── lib/
        ├── antidote.sh           # antidoteインストール
        ├── git.sh                # Git設定
        ├── vim_deps.sh           # Neovim依存関係インストール
        └── zplug.sh              # zplugインストール
```

## 依存関係

- **Git**: バージョン管理
- **Node.js**: LSP・各種言語サーバー用
- **ripgrep**: テキスト検索（fzf連携）
- **fd**: ファイル検索（fzf連携）
- **lazygit**: TUIのGitクライアント（floaterm経由で起動）
