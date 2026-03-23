# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# profile (末尾で結果表示)
[[ "$ZSHRC_PROFILE" != "" ]] && zprof

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
