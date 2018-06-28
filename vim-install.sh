#!/bin/sh

# Installing pathogen
echo Installing pathogen...
mkdir -p ~/.vim/autoload
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Installing the plugins
echo Installing bundles...
mkdir -p ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/scrooloose/nerdcommenter.git ~/.vim/bundle/nerdcommenter
git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git ~/.vim/bundle/syntastic
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
git clone https://github.com/dag/vim-fish.git ~/.vim/bundle/vim-fish
git clone https://github.com/editorconfig/editorconfig-vim.git ~/.vim/bundle/editorconfig-vim
git clone https://github.com/kshenoy/vim-signature.git ~/.vim/bundle/vim-signature
git clone https://github.com/tomasiser/vim-code-dark.git ~/vim/bundle/vim-code-dark

# Installing the color theme
echo Installing color theme...
mkdir -p ~/.vim/colors
git clone https://github.com/sickill/vim-monokai.git /tmp/vim-monokai
cp /tmp/vim-monokai/colors/monokai.vim ~/.vim/colors
rm -rf /tmp/vim-monokai

