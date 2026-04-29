# Vim / Neovim
## 設定

| 項目 | 説明 |
|------|------|
| **プラグイン管理** | Vundle |
| **カラースキーム** | molokai |
| **ファイルツリー** | NERDTree（`Ctrl+e`でトグル） |
| **補完エンジン** | coc.nvim |
| **ステータスライン** | Powerline（Vim）/ vim-airline（Neovim） |
| **Git連携** | vim-fugitive, vim-gitgutter |
| **フローティングターミナル** | vim-floaterm（`<leader>tt`: ターミナル, `<leader>g`: lazygit） |
| **テストランナー** | vim-test（`<leader>tn`: nearest, `<leader>tf`: file, `<leader>ts`: suite, `<leader>tl`: last） |
| **プロジェクトルート検出** | vim-rooter（`.git`を基準にcwdを自動変更） |
| **識別子ハイライト** | vim-illuminate（カーソル下の識別子を自動ハイライト） |
| **ファジーファインダー** | fzf, fzf.vim |
| **LaTeX** | vimtex |
| **コードフォーマット** | vim-prettier |
| **括弧・クォート自動補完** | auto-pairs |
| **HTMLタグ補完** | vim-closetag |
| **CSSカラープレビュー** | vim-css-color（カラーコードをその色で表示） |
| **コメントトグル** | vim-commentary（`gcc`: 行, `gc`: ビジュアル範囲） |
| **タブ・末尾スペースの可視化** | `set list` + `listchars`（タブ: `▸`, 末尾スペース: `·`） |
| **インデントガイド** | indentLine |
| **関数・クラス一覧** | tagbar |
| **オートセーブ** | vim-auto-save |
| **Undoツリー可視化** | gundo.vim |
| **クイック実行** | vim-quickrun |
| **Markdownプレビュー** | markdown-preview.nvim（`:MarkdownPreview`、Mermaid対応） |
| **キーバインド表示** | vim-which-key（`<leader>` or `<space>` 押下でポップアップ表示） |
| **ヤンクのハイライト** | vim-highlightedyank（ヤンク領域を300msハイライト表示） |

## キーバインド
| キー | 機能 |
|------|------|
| `<leader>ln` | 相対・絶対行番号をトグル |
| `Ctrl+P` | ファイル検索（fzf） |
| `Ctrl+F` | テキスト全体検索（fzf + ripgrep） |
| `<leader>s` | カーソル下の単語をプロジェクト全体で検索（fzf + ripgrep） |
| `<leader>b` | バッファ一覧（fzf） |
| `<leader>?` | キーバインド一覧（fzf、日本語説明付き） |
| `<leader>tt` | フローティングターミナルをトグル（vim-floaterm） |
| `<leader>g` | lazygitをフローティングウィンドウで起動（vim-floaterm） |
| `<leader>tn` | 最近傍テストを実行（vim-test） |
| `<leader>tf` | ファイル内テストを実行（vim-test） |
| `<leader>ts` | テストスイートを実行（vim-test） |
| `<leader>tl` | 最後のテストを再実行（vim-test） |

## coc.nvim キーバインド
| キー | 機能 |
|------|------|
| `gd` | 定義へジャンプ |
| `gy` | 型定義へジャンプ |
| `gi` | 実装へジャンプ |
| `gr` | 参照を表示 |
| `K` | ドキュメント表示 |
| `<leader>rn` | シンボルのリネーム |
| `<leader>f` | フォーマット |
| `<space>a` | 診断一覧 |
| `<space>e` | 拡張機能一覧 |


## Neovim設定

Neovim は `~/.config/nvim/` を設定ディレクトリとして使用する。
`dotfiles/.config/nvim/init.vim` が `~/.config/nvim/` にシンボリックリンクされており、既存の `.vimrc` をそのまま読み込む。

```
~/.config/nvim/init.vim  →  ~/dotfiles/.config/nvim/init.vim
```

## プラグインのインストール

```bash
# Neovim をインストール
sudo snap install nvim --classic

# Vundleをインストール
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim

# プラグインをインストール・依存関係のセットアップ（シンボリックリンク作成含む）
bash scripts/install.sh
```
