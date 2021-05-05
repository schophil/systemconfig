#!/usr/bin/env fish
# File: fish-install.fish
# Author: Philippe Schottey

stow fish
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fisher install barnybug/docker-fish-completion
fisher install reitzig/sdkman-for-fish
fisher install jorgebucaran/replay.fish
fisher install jethrokuan/z
fisher install simnalamburt/shellder
