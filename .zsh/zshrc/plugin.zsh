# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi
#
## zplug
source ~/.zplug/init.zsh

## theme
zplug romkatv/powerlevel10k, as:theme, depth:1

# 補完の強化
zplug zsh-users/zsh-completions

# fzf: ファジーファインダー
# Ctrl+R: 履歴検索, Ctrl+T: ファイル検索, Alt+C: ディレクトリ移動
zplug "junegunn/fzf", from:gh-r, as:command
zplug "junegunn/fzf", use:"shell/*.zsh"

# コマンドをリンクして、PATHに追加し、プラグインは読み込む
zplug load --verbose > /dev/null 2>&1

# fzf のデフォルトオプション
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# powerline
#if [ -f /usr/share/powerline/bindings/zsh/powerline.zsh ]; then
#    source /usr/share/powerline/bindings/zsh/powerline.zsh
#fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

