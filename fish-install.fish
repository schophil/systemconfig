#!/usr/bin/env fish
# File: fish-install.fish
# Author: Philippe Schottey

stow fish
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fisher add reitzig/sdkman-for-fish
fisher add fishpkg/fish-prompt-mono
fisher add barnybug/docker-fish-completion
