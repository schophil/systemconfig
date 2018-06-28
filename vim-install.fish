#!/opt/local/bin/fish
# File: vim-install.fish
# Author: Philippe Schottey

# Installing pathogen
echo Installing pathogen...
mkdir -p ~/.vim/autoload
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Installing the plugins
echo Installing bundles...
mkdir -p ~/.vim/bundle
./vim-install-plugins.fish

