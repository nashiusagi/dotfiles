# WezTerm

## 設定

| 項目 | 説明 |
|------|------|
| **バッテリー残量** | 右ステータスに表示 |
| **日時表示** | 右ステータスに表示 |
| **IME** | ibus 対応（`use_ime = true`） |
| **フォントサイズ** | 13 |
| **フォント** | MesloLGS NF（fallback: Noto Sans Mono CJK JP, Noto Color Emoji） |
| **ペイン分割線** | cyan（`#00ffff`） |
| **非アクティブペイン** | 彩度0.5・明度0.6で暗く表示 |
| **セッション永続化** | unix_domain によりウィンドウを閉じてもセッションが継続 |
| **セッション復元** | resurrect.wezterm により再起動後もタブ・ペイン構成を復元 |
| **背景透過** | `window_background_opacity = 0.85`（`Alt+t` でON/OFFトグル） |
| **スクロールバック** | 10000行（デフォルト3500行から拡張） |

## フォント

`MesloLGS NF` を使用している。フォントファイルは `fonts/` に同梱されており、`scripts/install.sh` によって `~/.local/share/fonts/` にコピーされる。

## セッション永続化

`unix_domain` を使ってWezTermをデーモンとして常駐させる。ウィンドウを閉じてもセッションが生き続け、再起動後も `wezterm connect unix` で既存セッションにアタッチできる。

`default_gui_startup_args = { "connect", "unix" }` により、WezTerm起動時に自動的にunixドメインへ接続する。

## セッション復元（resurrect.wezterm）

`resurrect.wezterm` プラグインにより、PCシャットダウン・再起動後もタブ・ペイン構成を復元できる。

- 15分ごとにセッション状態をファイルへ自動保存（tmux-continuumの15分保存相当）
- 自動保存のたびに復元ターゲットも更新される
- WezTerm起動時（`gui-startup`）に前回のセッションを自動復元（初回は15分待つか `Alt+s` で手動保存が必要）

## キーバインド

| キー | 機能 |
|------|------|
| `Alt+k` | 新規タブを開く |
| `Alt+j` | 現在のタブを閉じる |
| `Alt+h` | 左のタブへ移動 |
| `Alt+l` | 右のタブへ移動 |
| `Alt+Ctrl+h` | タブを左へ移動 |
| `Alt+Ctrl+l` | タブを右へ移動 |
| `Alt+Ctrl+k` | コピーモードに入る |
| `Alt+Ctrl+j` | プライマリセレクションからペースト |
| `Alt+1〜9` | タブ番号で移動 |
| `Ctrl+Shift+Alt+"` | 垂直分割 |
| `Ctrl+Shift+Alt+%` | 水平分割 |
| `Alt+g` | lazygitを新しいタブで起動 |
| `Ctrl+C` | クリップボードにコピー |
| `Alt+F9` | タブナビゲーターを表示 |
| `Alt+s` | セッション状態を手動保存 |
| `Alt+t` | 背景透過のON/OFFトグル（0.85 ↔ 1.0） |
| `Alt+r` | 保存済みセッションをfuzzy-loadで復元 |
| `Alt+f` | Search Modeに入る（スクロールバックをインクリメンタル検索） |

## マウスバインド

| 操作 | 機能 |
|------|------|
| 左クリックを離す | プライマリセレクションに選択をコピー |
| 右クリックを離す | クリップボードに選択をコピー |
| `Ctrl+左クリック` | リンクを開く |
