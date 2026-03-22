## tmux用
unset TMPDIR
TMUX_TMPDIR=/tmp

# IME (ibus + mozc)
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus

# rbenv
[[ -d ~/.rbenv ]] &&
export PATH="$HOME/.rbenv/bin:$PATH" &&
eval "$(rbenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:$PYENV_ROOT/bin"
eval "$(pyenv init --path)"

# nvm
export NVM_DIR="$HOME/.nvm"
# nvm の lazy load（起動速度改善）
nvm() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  nvm "$@"
}

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# SDKMAN (must be loaded after SDKMAN_DIR is set)
export SDKMAN_DIR="$HOME/.sdkman"
export SDKMAN_CANDIDATES_DIR="$SDKMAN_DIR/candidates"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
