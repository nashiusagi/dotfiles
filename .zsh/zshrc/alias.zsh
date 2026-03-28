# eza (ls の置き換え)
alias ls="eza --color=always"
alias ll="eza -lh --git"
alias la="eza -lah --git"
alias lt="eza --tree --level=2"

alias ...='cd ../..'

# bat (cat の置き換え)
# Ubuntu では batcat としてインストールされる
# batcat がインストールされていない環境では cat をそのまま使う
if (( $+commands[batcat] )); then
  alias bat="batcat"
  alias cat="bat --paging=never --style=plain"
  export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
fi

# fd (Ubuntu では fdfind としてインストールされる)
alias fd="fdfind"

# wezterm
alias wezterm="flatpak run org.wezfurlong.wezterm"

# branch
_br() {
  git branch --show-current
}
