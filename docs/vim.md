# Vim / Neovim
## 設定

| 項目 | 説明 |
|------|------|
| **プラグイン管理** | Vundle |
| **カラースキーム** | molokai |
| **ファイルツリー** | NERDTree（`Ctrl+e`でトグル） |
| **補完エンジン** | coc.nvim |
| **ステータスライン** | Powerline（Vim）/ vim-airline（Neovim） |
| **Git連携** | vim-fugitive |
| **LaTeX** | vimtex |
| **コードフォーマット** | vim-prettier |
| **HTMLタグ補完** | vim-closetag |

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
