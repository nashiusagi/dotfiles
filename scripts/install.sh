ln -s ~/dotfiles/.vimrc ~/.vimrc

source $(dirname "${BASH_SOURCE[0]:-$0}")/lib/powerline.sh
source $(dirname "${BASH_SOURCE[0]:-$0}")/lib/vim_deps.sh

powerline

sudo apt install -y nodejs npm
npm install -g yarn
cd ~/.vim/bundle/coc.nvim
yarn install
cd ~

vim_deps
