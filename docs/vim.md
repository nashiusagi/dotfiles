# Neovim
## 設定

| 項目 | 説明 |
|------|------|
| **プラグイン管理** | lazy.nvim |
| **カラースキーム** | molokai |
| **ファイルツリー** | NERDTree（`Ctrl+e`でトグル） |
| **補完エンジン** | nvim-cmp + LuaSnip |
| **LSP** | Neovim native LSP（mason でサーバー管理） |
| **ステータスライン** | lualine.nvim |
| **Git連携** | vim-fugitive, gitsigns.nvim |
| **フローティングターミナル** | vim-floaterm（`<leader>tt`: ターミナル, `<leader>g`: lazygit） |
| **テストランナー** | vim-test（floaterm連携） |
| **プロジェクトルート検出** | vim-rooter（`.git`を基準にcwdを自動変更） |
| **識別子ハイライト** | vim-illuminate（250ms遅延） |
| **ファジーファインダー** | fzf, fzf.vim |
| **LaTeX** | vimtex |
| **コードフォーマット** | vim-prettier |
| **括弧・クォート自動補完** | auto-pairs |
| **HTMLタグ補完** | vim-closetag |
| **CSSカラープレビュー** | vim-css-color |
| **コメントトグル** | vim-commentary（`gcc`: 行, `gc`: ビジュアル範囲） |
| **インデントガイド** | indent-blankline.nvim |
| **関数・クラス一覧** | tagbar（`Ctrl+t`でトグル） |
| **オートセーブ** | vim-auto-save |
| **Undoツリー可視化** | gundo.vim |
| **クイック実行** | vim-quickrun |
| **Markdownプレビュー** | markdown-preview.nvim（`:MarkdownPreview`、Mermaid対応） |
| **キーバインド表示** | vim-which-key（`<leader>` 押下でポップアップ表示） |
| **ヤンクのハイライト** | vim-highlightedyank（300ms） |

## キーバインド

### 基本
| キー | 機能 |
|------|------|
| `<leader>ln` | 相対・絶対行番号をトグル |
| `Ctrl+h/j/k/l` | split間の移動 |
| `<leader>?` | キーバインド一覧（fzf、日本語説明付き） |

### 検索・ナビゲーション
| キー | 機能 |
|------|------|
| `Ctrl+p` | ファイル検索（fzf） |
| `Ctrl+f` | テキスト全体検索（ripgrep） |
| `<leader>s` | カーソル下の単語をプロジェクト全体で検索 |
| `<leader>b` | バッファ一覧 |
| `Ctrl+e` | NERDTreeトグル |
| `Ctrl+t` | tagbarトグル |

### LSP
| キー | 機能 |
|------|------|
| `gd` | 定義へジャンプ |
| `gy` | 型定義へジャンプ |
| `gi` | 実装へジャンプ |
| `gr` | 参照を表示 |
| `K` | ドキュメント表示 |
| `<leader>rn` | シンボルのリネーム |
| `<leader>f` | フォーマット |
| `<leader>a` | コードアクション |
| `[g` / `]g` | 診断の前/次へ |
| `<space>a` | 診断一覧 |

### ターミナル・テスト
| キー | 機能 |
|------|------|
| `<leader>tt` | フローティングターミナルをトグル |
| `<leader>g` | lazygitを起動 |
| `<leader>tn` | 最近傍テストを実行 |
| `<leader>tf` | ファイル内テストを実行 |
| `<leader>ts` | テストスイートを実行 |
| `<leader>tl` | 最後のテストを再実行 |

## LSPサーバー

| 言語 | サーバー |
|------|--------|
| Python | pyright |
| Go | gopls |

追加は `lsp.lua` の `ensure_installed` と `vim.lsp.config` に記述する。

## Neovim設定ファイル構成

```
~/.config/nvim/  →  ~/dotfiles/.config/nvim/
├── init.lua                  # エントリーポイント（lazy.nvim bootstrap）
└── lua/
    ├── config/
    │   ├── options.lua       # 基本設定
    │   ├── keymaps.lua       # キーマップ
    │   └── autocmds.lua      # 自動コマンド
    └── plugins/
        ├── ui.lua            # UI系プラグイン
        ├── editor.lua        # 編集支援系プラグイン
        ├── git.lua           # Git系プラグイン
        ├── lsp.lua           # LSP + 補完
        ├── search.lua        # 検索・ファイルナビゲーション
        └── lang.lua          # 言語別プラグイン
```

## lazy.nvim 管理コマンド

| コマンド | 機能 |
|----------|------|
| `:Lazy` | プラグイン管理UI |
| `:Mason` | LSPサーバー管理UI |

## インストール

```bash
# Neovim をインストール（AppImage推奨）
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.appimage
chmod +x nvim-linux-x86_64.appimage
sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim

# シンボリックリンク作成・依存関係のセットアップ
bash scripts/install.sh
# → 初回起動時に lazy.nvim が全プラグインを自動インストールする
```
