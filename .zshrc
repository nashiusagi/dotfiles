#==============================================================#
#               .zshrc                                         #
#==============================================================#

# profile
if [ "$ZSHRC_PROFILE" != "" ]; then
    zmodload zsh/zprof && zprof > /dev/null
fi

source "$ZSHRCDIR/env.zsh"
source "$ZSHRCDIR/option.zsh"
source "$ZSHRCDIR/completion.zsh"
source "$ZSHRCDIR/prompt.zsh"
source "$ZSHRCDIR/alias.zsh"
source "$ZSHRCDIR/plugin.zsh"
