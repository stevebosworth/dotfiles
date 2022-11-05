#!/bin/sh

if [ $SPIN ]; then
  # Install Ripgrep for better code searching: `rg <string>` to search. Obeys .gitignore
  sudo apt-get install -y ripgrep

  # Set system generated .gitconfig to .gitconfig.local. We'll pull it in later as part
  # of our custom gitconfig. The generated gitconfig already has the right user and email,
  # since Spin knows that from login.
  mv -n ~/.gitconfig ~/.gitconfig.local
fi

