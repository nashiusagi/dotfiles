# eza (ls の置き換え)
alias ls="eza --color=always"
alias ll="eza -lh --git"
alias la="eza -lah --git"
alias lt="eza --tree --level=2"

alias ...='cd ../..'

# bat (cat の置き換え)
# Ubuntu では batcat、macOS (brew) では bat としてインストールされる
if (( $+commands[batcat] )); then
  alias bat="batcat"
  alias cat="batcat --paging=never --style=plain"
  export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
elif (( $+commands[bat] )); then
  alias cat="bat --paging=never --style=plain"
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# fd (Ubuntu では fdfind としてインストールされる)
alias fd="fdfind"

# wezterm
alias wezterm="flatpak run org.wezfurlong.wezterm"

# branch
_br() {
  git branch --show-current
}
