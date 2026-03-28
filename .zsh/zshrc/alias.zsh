# eza (ls の置き換え)
alias ls="eza --color=always"
alias ll="eza -lh --git"
alias la="eza -lah --git"
alias lt="eza --tree --level=2"

alias ...='cd ../..'

# bat (cat の置き換え)
# Ubuntu では batcat、macOS (brew) では bat としてインストールされる
if (( $+commands[batcat] )); then
  alias bat="batcat"  # `bat filename` で直接呼び出せるようにする
  alias cat="batcat --paging=never --style=plain"
  export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
elif (( $+commands[bat] )); then
  alias cat="bat --paging=never --style=plain"
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# fd (Ubuntu では fdfind としてインストールされる)
if (( $+commands[fdfind] )); then
  alias fd="fdfind"
fi

# wezterm (Ubuntu では flatpak 経由)
if [[ "$(uname)" == "Linux" ]] && (( $+commands[flatpak] )); then
  alias wezterm="flatpak run org.wezfurlong.wezterm"
fi

# branch
_br() {
  git branch --show-current
}
