ln -s ~/dotfiles/.vimrc ~/.vimrc

source $(dirname "${BASH_SOURCE[0]:-$0}")/lib/powerline.sh
source $(dirname "${BASH_SOURCE[0]:-$0}")/lib/vim_deps.sh
source $(dirname "${BASH_SOURCE[0]:-$0}")/lib/git.sh

powerline

sudo apt install -y fd-find nodejs npm
npm install -g yarn
cd ~/.vim/bundle/coc.nvim
yarn install
cd ~

vim_deps
