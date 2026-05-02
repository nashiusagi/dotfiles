set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# resurrect
set -g @resurrect-strategy-vim 'session'

# Initialize TMUX plugin manager
run '~/.tmux/plugins/tpm/tpm'

# restore session before rebooting
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @resurrect-strategy-vim 'session'

# tmux-continuumでセッションを自動保存・自動復元（tmux-resurrectの後に読み込む）
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @continuum-restore 'on'
set -g @continuum-save-interval '15'


