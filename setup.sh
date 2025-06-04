#!/bin/bash

function link_dotdir {
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

function link_dotfile {
  src=$1
  dst=$src
  echo $dst
  if [ -e ~/$dst ]; then
    unlink ~/$dst
  fi
  ln -s $PWD/$src ~/$dst 
}


link_dotfile .myrc.sh
link_dotdir .config
link_dotdir .local/share
# link_dotdir .themes
