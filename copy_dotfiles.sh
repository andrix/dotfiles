#!/bin/sh
## Copy dotfiles to the git repo


DOTFILES_REPO=~/git/dotfiles
DOTFILES=".gvimrc .hgrc .noserc .pylintrc .vim .vimrc .xmonad .xprofile .gitconfig"
for f in $DOTFILES; do
    echo "Copying  $f to $DOTFILES_REPO"
    cp -r $HOME/$f $DOTFILES_REPO
done
