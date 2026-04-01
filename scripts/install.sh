#!/bin/bash
set -ue

ln -s ~/dotfiles/.vimrc ~/.vimrc

source $(dirname "${BASH_SOURCE[0]:-$0}")/lib/powerline.sh
source $(dirname "${BASH_SOURCE[0]:-$0}")/lib/vim_deps.sh
source $(dirname "${BASH_SOURCE[0]:-$0}")/lib/git.sh

powerline
install_delta
setup_gitconfig

sudo apt install -y eza fd-find nodejs npm groff
# bat は Ubuntu 22.04以降のみ apt でインストール可能
if apt-cache show bat &>/dev/null; then
  sudo apt install -y bat
else
  echo "⚠️  bat が apt で見つかりませんでした。手動でインストールしてください:"
  echo "    https://github.com/sharkdp/bat/releases"
fi
npm install -g yarn

# navi (command cheatsheet) — cargo が利用可能な場合にインストール
if command -v cargo &>/dev/null; then
  cargo install navi
else
  echo "⚠️  cargo が見つかりませんでした。navi をインストールするには Rust をインストールしてください:"
  echo "    https://rustup.rs/"
fi
cd ~/.vim/bundle/coc.nvim
yarn install
cd ~

vim +PluginInstall +qall
vim_deps
