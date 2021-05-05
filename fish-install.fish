#!/usr/bin/env fish
# File: fish-install.fish
# Author: Philippe Schottey

stow fish
curl -sL https://git.io/fisher | source && fisher update
