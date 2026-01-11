## マウス操作を有効化
set -g mouse on
bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'copy-mode -e'"
bind -n WheelDownPane select-pane -t=\; send-keys -M

## ペインの移動をVim形式にする
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

## 画面分割
bind - split-window -v
unbind '%'
bind | split-window -h
unbind '"'

## Prefixキーを Ctrl-s に変更
### デフォルトのCtrl+bを解除
unbind C-b
### 新しいPrefixキーをCtrl+sに設定
set -g prefix C-s
### Ctrl+sを2回押すとtmux内のアプリにCtrl+sを送る
bind C-s send-prefix

## Vimキーバインドでペインの中身を走査する
set-window-option -g mode-keys vi
