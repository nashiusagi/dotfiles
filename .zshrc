#==============================================================#
#               .zshrc                                         #
#==============================================================#

# profile (先頭で計測開始)
[[ "$ZSHRC_PROFILE" != "" ]] && zmodload zsh/zprof

source "$ZSHRCDIR/env.zsh"
source "$ZSHRCDIR/option.zsh"
source "$ZSHRCDIR/plugin.zsh"
source "$ZSHRCDIR/completion.zsh"
source "$ZSHRCDIR/prompt.zsh"
source "$ZSHRCDIR/alias.zsh"
source "$ZSHRCDIR/fzf.zsh"

# profile (末尾で結果表示)
[[ "$ZSHRC_PROFILE" != "" ]] && zprof
