# eza (ls の置き換え)
alias ls="eza --color=always"
alias ll="eza -lh --git"
alias la="eza -lah --git"
alias lt="eza --tree --level=2"

alias ...='cd ../..'

# fd (Ubuntu では fdfind としてインストールされる)
alias fd="fdfind"

# wezterm
alias wezterm="flatpak run org.wezfurlong.wezterm"

# branch
_br() {
  git branch --show-current
}
