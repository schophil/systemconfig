#!/usr/bin/env fish
# File: fish-install.fish
# Author: Philippe Schottey

rm -rf ~/.config/fish
stow fish
curl -sL https://git.io/fisher | source && fisher update

fisher install jorgebucaran/fisher
fisher install reitzig/sdkman-for-fish
fisher install jorgebucaran/replay.fish
fisher install jethrokuan/z
fisher install jorgebucaran/hydro
fisher install schophil/fish-docker
