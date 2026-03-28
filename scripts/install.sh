ln -s ~/dotfiles/.vimrc ~/.vimrc

source $(dirname "${BASH_SOURCE[0]:-$0}")/lib/powerline.sh
source $(dirname "${BASH_SOURCE[0]:-$0}")/lib/vim_deps.sh
source $(dirname "${BASH_SOURCE[0]:-$0}")/lib/git.sh

powerline

# bat: Ubuntu 22.04以降では apt install bat でインストール可能
# Ubuntu 20.04以前の場合は https://github.com/sharkdp/bat/releases から .deb を取得すること
sudo apt install -y eza fd-find nodejs npm bat groff
npm install -g yarn
cd ~/.vim/bundle/coc.nvim
yarn install
cd ~

vim +PluginInstall +qall
vim_deps
