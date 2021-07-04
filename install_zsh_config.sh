#!/usr/bin/env bash

rm -i ~/.zshrc ~/.zsh_alias

FILE=~/.zshrc
if [ ! -f "$FILE" ]; then
    exit 1
fi

FILE=~/.zsh_alias
if [ ! -f "$FILE" ]; then
    exit 1
fi

ln -s $DIR/zsh/.zshrc $HOME
ln -s $DIR/zsh/.zsh_alias $HOME

source ~/.zshrc
