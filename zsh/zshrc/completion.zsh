## git-completionの読み込み
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit

## lsの色と一致させる
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

## [TAB]でパス名の補完候補を表示した後、
## 続けて[TAB]を押すと候補からパス名を選択できるようになる
## 候補を選ぶには[TAB]かctrl-N,B,F,P
zstyle ':completion:*:default' menu select=1
