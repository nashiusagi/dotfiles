#==============================================================#
#               .zshrc                                         #
#==============================================================#

# profile
if [ "$ZSHRC_PROFILE" != "" ]; then
    zmodload zsh/zprof && zprof > /dev/null
fi


source "$ZSHRCDIR/alias.zsh"
source "$ZSHRCDIR/base.zsh"
source "$ZSHRCDIR/plugin.zsh"
source "$ZSHRCDIR/option.zsh"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/ryogo-ito/.sdkman"
export SDKMAN_CANDIDATES_DIR="/home/ryogo-ito/.sdkman/candidates"
source ~/.sdkman/bin/sdkman-init.sh
[[ -s "/home/ryogo-ito/.sdkman/bin/sdkman-init.sh" ]] && source "/home/ryogo-ito/.sdkman/bin/sdkman-init.sh"

# pnpm
export PNPM_HOME="/home/ryogo-ito/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/home/ryogo-ito/.bun/_bun" ] && source "/home/ryogo-ito/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
