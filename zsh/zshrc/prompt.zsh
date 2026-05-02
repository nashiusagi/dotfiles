## プロンプト表示
rand=$(( RANDOM % 2 ))
if [ $rand -eq 0 ]; then
    piyo='🐣'
else
    piyo='🐥'
fi

## git-promptの読み込み
source ~/.zsh/git-prompt.sh

## プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

setopt PROMPT_SUBST; PS1="${piyo}"'%F{green}%n@%m%F{white}:%f%f%F{blue}%~%f %F{red}$(__git_ps1 "(%s)")%f$ '
