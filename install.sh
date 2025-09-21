#!/usr/bin/env bash

mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.local/share"
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/gh" #GitHub CLI

stow --dotfiles -t "$HOME" .
