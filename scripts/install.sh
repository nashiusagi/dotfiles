ln -s ~/dotfiles/.vimrc ~/.vimrc

source $(dirname "${BASH_SOURCE[0]:-$0}")/lib/powerline.sh
source $(dirname "${BASH_SOURCE[0]:-$0}")/lib/vim_deps.sh
source $(dirname "${BASH_SOURCE[0]:-$0}")/lib/git.sh

powerline

sudo apt install -y eza fd-find nodejs npm groff
# bat は Ubuntu 22.04以降のみ apt でインストール可能
if apt-cache show bat &>/dev/null 2>&1; then
  sudo apt install -y bat
else
  echo "⚠️  bat が apt で見つかりませんでした。手動でインストールしてください:"
  echo "    https://github.com/sharkdp/bat/releases"
fi
npm install -g yarn
cd ~/.vim/bundle/coc.nvim
yarn install
cd ~

vim +PluginInstall +qall
vim_deps
