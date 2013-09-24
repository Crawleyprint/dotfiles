#! /bin/bash

home_dir=/Users/mladen
#set dotfiles repo location
target_dir=$home_dir/repos/dotfiles

#and cd there
cd $target_dir &&

#update submodules to enable Vundle
git submodule update --init &&

cd $home_dir &&

#loop through files and link them
for file in vimrc vim tmux.conf teamocil ackrc gitconfig zshrc slate
do
  echo "Linking $file."
  ln -s $target_dir/$file $home_dir/.$file
done

echo "Linking keyremap file"

ln -s $target_dir/keyremap.xml $home_dir/Library/Application\ Support/KeyRemap4MacBook/private.xml

#run vim for the first time and install bundles
vim +BundleInstall +qall
