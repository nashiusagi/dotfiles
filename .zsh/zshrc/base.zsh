## vimライクな操作を有効にする
## 文字入力中のカーソル移動など bindkey -v
## プロンプト表示
rand=`expr $RANDOM % 2`
if [ $rand -eq 0 ]; then
    piyo='🐣'
else
    piyo='🐥'
fi

# git
## git-promptの読み込み
source ~/.zsh/git-prompt.sh

## git-completionの読み込み
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit

## プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

setopt PROMPT_SUBST; PS1="${piyo}"'%F{green}%n@%m%F{white}:%f%f%F{blue}%~%f %F{red}$(__git_ps1 "(%s)")%f$ '

## 色を使用できるようにする
#autoload -Uz colors;colors


## ヒストリを保存、数を増やす
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

## [TAB]でパス名の補完候補を表示した後、
## 続けて[TAB]を押すと候補からパス名を選択できるようになる
## 候補を選ぶには[TAB]かctrl-N,B,F,P
zstyle ':completion:*:default' menu select=1

## tmux用
unset TMPDIR
TMUX_TMPDIR=/tmp

# rbenv
[[ -d ~/.rbenv ]] &&
export PATH="$HOME/.rbenv/bin:$PATH" &&
eval "$(rbenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:$PYENV_ROOT/bin"
eval "$(pyenv init --path)"
export NVM_DIR="$HOME/.nvm"
# nvm の lazy load（起動速度改善）
nvm() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  nvm "$@"
}
#export PATH="/usr/bin/python3:$PATH"


