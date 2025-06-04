#!/bin/bash

function link_dotfiles {
  mkdir -p ~/$1 
  src=$1
  for file in $(/usr/bin/ls $src)
  do
    dst=$src/$file
  	echo $dst
    if [ -e ~/$dst ]; then
  	  unlink ~/$dst
   	fi
  	ln -s $PWD/$dst ~/$dst
  done
}

ln -s $PWD/.myrc.sh ~/.myrc.sh
link_dotfiles .config
link_dotfiles .local/share
