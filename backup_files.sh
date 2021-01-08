#!/bin/bash

# create backup folder
cd ~/dotfiles/removedFiles
BACKUP_FOLDER = ~/dotfiles/removedFiles/$(date +%Y%m%d_%H%M%S)
mkdir -p $BACKUP_FOLDER
echo "Created backup folder at " $BACKUP_FOLDER

echo "Start file backup..."

FILE=~/.xinitrc
if test -f "$FILE"; then
    cp $FILE $BACKUP_FOLDER
fi

FILE=~/.zshrc
if test -f "$FILE"; then
    cp $FILE $BACKUP_FOLDER
fi

echo "Backup complete."
