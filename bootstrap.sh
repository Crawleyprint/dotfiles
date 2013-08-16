#! /bin/bash

home_dir=/Users/mladen/
#set dotfiles repo location
target_dir=/Users/mladen/repos/dotfiles

#and cd there
cd $target_dir

#update submodules to enable Vundle
git submodule update --init &&

cd

#loop through files and link them
for file in vimrc vim tmux.conf teamocil ackrc gitconfig zshrc
do
  echo "Linking $file."
  ln -s $target_dir/$file .$file
done

#run vim for the first time and install bundles
vim +BundleInstall +qall
