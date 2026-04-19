# Git

## 設定

| 項目 | 説明 |
|------|------|
| **エディタ** | vim |
| **pager** | delta |
| **デフォルトブランチ** | main |

## delta

`git diff` / `git show` / `git log -p` の出力を見やすくする pager。

| 設定 | 値 | 説明 |
|------|----|------|
| `navigate` | true | `n`/`N` キーで差分間を移動 |
| `side-by-side` | true | 変更前後を横並びで表示 |
| `line-numbers` | true | 行番号を表示 |
| `merge.conflictstyle` | diff3 | マージコンフリクトを見やすく表示 |
| `diff.colorMoved` | default | 移動したコードを色分け |

## インストール

```bash
sudo apt install git-delta
```

## forgit

fzf のインタラクティブUIで git 操作を行える zsh プラグイン。

| コマンド | 機能 |
|---------|------|
| `ga` | `git add` をfzfで選択 |
| `glo` | `git log` をfzfで閲覧 |
| `gd` | `git diff` をfzfで閲覧 |
| `gcb` | `git checkout` ブランチをfzfで選択 |
| `gco` | `git checkout` ファイルをfzfで選択 |
| `grh` | `git reset HEAD` をfzfで選択 |
| `gss` | `git stash show` をfzfで選択 |

## ユーザー情報の設定

`~/.gitconfig` はスクリプトで生成する（ユーザー情報は `.gitconfig_example` に含めない）。

```bash
bash scripts/lib/git.sh
```
