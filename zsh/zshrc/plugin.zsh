# antidote
source ~/.antidote/antidote.zsh

# 静的バンドル: zsh_plugins.txt が変わったときだけ再生成
zsh_plugins_cache=${ZDOTDIR:-~}/.zsh_plugins.zsh
if [[ ! $zsh_plugins_cache -nt $ZHOMEDIR/zsh_plugins.txt ]]; then
  antidote bundle <$ZHOMEDIR/zsh_plugins.txt >$zsh_plugins_cache
fi
source $zsh_plugins_cache

# fzf のデフォルトオプション
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
