#!/bin/sh
#
# Karabiner-Elements
#
# Installs Karabiner-Elements and sets up config

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

# Check for Karabiner-Elements
if [ ! -d "/Applications/Karabiner-Elements.app" ]; then
  info "Installing Karabiner-Elements"

  if test "$(uname)" = "Darwin"
  then
    if test $(which brew)
    then
      brew install --cask karabiner-elements
      success "Karabiner-Elements installed"
    else
      fail "Homebrew not found. Please install Homebrew first."
    fi
  else
    fail "Karabiner-Elements is only available on macOS"
  fi
else
  info "Karabiner-Elements already installed"
fi

# Install config
info "Installing Karabiner config"

src="$DOTFILES_ROOT/karabiner/karabiner.json"
dst="$HOME/.config/karabiner/karabiner.json"

# Make sure karabiner config folder exists
mkdir -p "$HOME/.config/karabiner"

# Clean up existing config and link new one
rm -rf "$dst"
ln -s "$src" "$dst"
success "Linked $src to $dst"

echo ''
echo "  Karabiner-Elements setup complete!"
echo "  Don't forget to grant permissions in System Preferences > Privacy & Security"
echo ''

exit 0
