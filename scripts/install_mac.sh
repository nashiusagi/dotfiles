#!/bin/bash
set -ue

# macOS チェック
if [[ "$(uname)" != "Darwin" ]]; then
  echo "エラー: このスクリプトは macOS 専用です。"
  echo "Ubuntu の場合は scripts/install.sh を使ってください。"
  exit 1
fi

# Homebrew の確認
if ! command -v brew &>/dev/null; then
  echo "エラー: Homebrew がインストールされていません。"
  echo "以下のコマンドでインストールしてください:"
  echo '  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  exit 1
fi

ln -s ~/dotfiles/.vimrc ~/.vimrc

source "$(dirname "${BASH_SOURCE[0]:-$0}")/lib/vim_deps.sh"
source "$(dirname "${BASH_SOURCE[0]:-$0}")/lib/git.sh"

install_delta
setup_gitconfig

brew install eza fd bat node groff

brew install --cask wezterm

npm install -g yarn
cd ~/.vim/bundle/coc.nvim
yarn install
cd ~

vim +PluginInstall +qall
vim_deps
