#!/bin/sh

base=`pwd`

mkdir -p ~/.config/fish
ln -s -f $base/fish/config.fish ~/.config/fish/config.fish 
ln -s -f $base/fish/functions ~/.config/fish/functions 


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

