# Zsh
## 設定

| 項目 | 説明 |
|------|------|
| **プラグイン管理** | antidote |
| **テーマ** | Powerlevel10k |
| **補完** | zsh-completions |
| **ファジーファインダー** | fzf |
| **シンタックスハイライト** | zsh-syntax-highlighting |
| **コマンド候補表示** | zsh-autosuggestions |

## エイリアス
| エイリアス | コマンド | 説明 |
|-----------|----------|------|
| `ls` | `eza --color=always` | カラー表示 |
| `ll` | `eza -lh --git` | 詳細表示（git状態付き） |
| `la` | `eza -lah --git` | 隠しファイルも含む詳細表示 |
| `lt` | `eza --tree --level=2` | ディレクトリツリー表示 |
| `...` | `cd ../..` | 2階層上に移動 |
| `fd` | `fdfind` | fd（Ubuntu向けエイリアス） |
| `wezterm` | `flatpak run org.wezfurlong.wezterm` | WezTerm 起動 |
| `bat` | `batcat` | bat（Ubuntu向けエイリアス） |
| `cat` | `batcat --paging=never --style=plain`（Ubuntu）/ `bat --paging=never --style=plain`（macOS） | シンタックスハイライト付きファイル表示 |

## bat

`MANPAGER` を設定し、manページをシンタックスハイライト付きで表示する。

| 環境 | 設定値 |
|------|--------|
| Ubuntu | `sh -c 'col -bx \| batcat -l man -p'` |
| macOS | `sh -c 'col -bx \| bat -l man -p'` |

## キーバインド

fzf プラグイン（`junegunn/fzf`）が提供するキーバインド：

| キー | 機能 |
|------|------|
| `Ctrl+R` | コマンド履歴をファジー検索 |
| `Ctrl+T` | カレントディレクトリ以下のファイルをファジー検索してコマンドラインに挿入 |
| `Alt+C` | ディレクトリをファジー検索して cd |

補完：

| キー | 機能 |
|------|------|
| `Tab` | 補完候補を表示 / 候補を選択 |
| `Ctrl+N` / `Ctrl+F` | 次の補完候補へ |
| `Ctrl+P` / `Ctrl+B` | 前の補完候補へ |

## fzf
- デフォルトオプション: `--height 40% --layout=reverse --border`
- `FZF_DEFAULT_COMMAND`: `fd --type f --hidden --exclude .git`（fd と連携）

## 対応する開発環境
- **Python**: pyenv
- **Ruby**: rbenv
- **Node.js**: nvm（lazy load）, pnpm, bun
- **Java**: SDKMAN
- **Rust**: cargo

## antidote のインストール

```bash
git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote
```
