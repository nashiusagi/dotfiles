# tmux
## 設定

| 項目 | 説明 |
|------|------|
| **Prefixキー** | `Ctrl-s` |
| **256色対応** | 有効 |
| **マウス操作** | 有効 |
| **ペイン移動** | Vim形式（`h`, `j`, `k`, `l`） |
| **コピーモード** | Vimキーバインド |

## プラグイン

| プラグイン | 説明 |
|-----------|------|
| **tpm** | プラグインマネージャー |
| **tmux-sensible** | 基本設定の最適化 |
| **tmux-resurrect** | セッションの手動保存・復元（`prefix+Ctrl+s`: 保存, `prefix+Ctrl+r`: 復元） |
| **tmux-continuum** | セッションの自動保存（15分ごと）・再起動時に自動復元 |

> tmux-continuumの状態確認: `tmux show-option -gv @continuum-status`

## キーバインド
| キー | 機能 |
|------|------|
| `C-s` | Prefix |
| `C-s C-s` | tmux内アプリにCtrl-sを送信 |
| `-` | 水平分割 |
| `\|` | 垂直分割 |
| `h/j/k/l` | ペイン移動 |
| `M-g` | lazygitをPopupウィンドウで起動 |
| `M-s` | fzfでtmuxセッションを選択・切り替え |
