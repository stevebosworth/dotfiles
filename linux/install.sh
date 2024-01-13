#!/bin/sh

if test "$(expr substr $(uname -s) 1 5)" = "Linux"
then
  xargs sudo apt-get -y install < $ZSH/linux/packages.txt
fi

