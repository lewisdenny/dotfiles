#!/usr/bin/env bash

mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.local/share"
mkdir -p "$HOME/.config"

stow --dotfiles -t "$HOME" .
