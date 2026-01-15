#!/bin/sh

if [ "$(uname -s | cut -c1-5)" = "Linux" ]
then
  xargs sudo apt-get -y install < $ZSH/linux/packages.txt
fi

