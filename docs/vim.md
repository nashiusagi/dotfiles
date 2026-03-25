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
| **ファジーファインダー** | fzf, fzf.vim |
| **LaTeX** | vimtex |
| **コードフォーマット** | vim-prettier |
| **HTMLタグ補完** | vim-closetag |
| **コメントトグル** | vim-commentary（`gcc`: 行, `gc`: ビジュアル範囲） |
| **インデントガイド** | indentLine |
| **関数・クラス一覧** | tagbar |
| **オートセーブ** | vim-auto-save |
| **Undoツリー可視化** | gundo.vim |
| **クイック実行** | vim-quickrun |

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

# プラグインをインストール
vim +PluginInstall +qall
```
