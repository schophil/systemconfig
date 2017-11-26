#!/bin/sh

mkdir -p ~/config/fish
ln -s -f ~/config/fish/config.fish ./fish/config.fish
ln -s -f ~/config/fish/functions ./fish/functions

base=`pwd`

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

