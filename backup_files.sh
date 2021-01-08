#!/bin/bash

# create backup folder
cd ~/dotfiles/removedFiles
BACKUPFOLDER=~/dotfiles/removedFiles/$(date +%Y%m%d_%H%M%S)
echo $BACKUPFOLDER
mkdir -p $BACKUPFOLDER
echo "Created backup folder at " $BACKUPFOLDER

echo "Start file backup..."

FILE=~/.xinitrc
if test -f "$FILE"; then
    cp $FILE $BACKUPFOLDER
fi

FILE=~/.zshrc
if test -f "$FILE"; then
    cp $FILE $BACKUPFOLDER
fi

echo "Backup complete."
