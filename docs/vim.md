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

## キーバインド
| キー | 機能 |
|------|------|
| `<leader>ln` | 相対・絶対行番号をトグル |
| `Ctrl+P` | ファイル検索（fzf） |
| `Ctrl+F` | テキスト全体検索（fzf + ripgrep） |
| `<leader>s` | カーソル下の単語をプロジェクト全体で検索（fzf + ripgrep） |
| `<leader>b` | バッファ一覧（fzf） |
| `<leader>?` | キーバインド一覧（fzf、日本語説明付き） |

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


## プラグインのインストール

```bash
# Vundleをインストール
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim

# プラグインをインストール・依存関係のセットアップ
bash scripts/install.sh
```
