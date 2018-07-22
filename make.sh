#!/bin/sh

base=`pwd`

mkdir -p ~/.config/fish
mkdir -p ~/.vim
ln -s -f $base/fish/config.fish ~/.config/fish/config.fish 
ln -s -f $base/fish/functions ~/.config/fish/functions 
ln -s -f $base/snippets ~/.vim/snippets

for file in dotfiles/*
do
	fname=`basename $file`
	if [ -f ~/.$fname ]
	then
		echo "Backing up existing ~/.$fname"
		mv ~/.$fname ~/.$fname.original
	fi
	echo "Sim linking $fname"
	ln -s $base/dotfiles/$fname ~/.$fname
done

