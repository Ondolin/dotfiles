#!/usr/bin/env bash

PS3="Select the package manager: "

select opt in apt pacman homebrew quit; do

  case $opt in
    apt)
      sh ./installers/apt.sh
      break
      ;;
    pacman)
      sh ./installers/pacman.sh
      break
      ;;
    homebrew)
      echo "currently not supported"
      #break
      ;;
    quit)
      exit
      ;;
    *) 
      echo "Invalid option $REPLY"
      ;;
  esac
done

