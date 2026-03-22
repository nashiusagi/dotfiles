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

## 自動補完を有効にする
autoload -Uz compinit && compinit

## tmux用
unset TMPDIR
TMUX_TMPDIR=/tmp

# rbenv
[[ -d ~/.rbenv ]] &&
export PATH="$HOME/.rbenv/bin:$PATH" &&
eval "$(rbenv init -)"

## sdkman
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!$
export SDKMAN_DIR="$HOME/.sdkman"$
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:$PYENV_ROOT/bin"
eval "$(pyenv init --path)"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
#export PATH="/usr/bin/python3:$PATH"

# pnpm
export PNPM_HOME="/home/ryogo-ito/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

