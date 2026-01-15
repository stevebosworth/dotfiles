#!/bin/sh
#
# Tmux
#
# Installs TPM (Tmux Plugin Manager) and plugins

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

# Check for TPM
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  info "Installing TPM (Tmux Plugin Manager)"

  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

  if [ $? -eq 0 ]; then
    success "TPM installed"
  else
    fail "Failed to install TPM"
  fi
else
  info "TPM already installed"
fi

# Install/update tmux plugins
info "Installing tmux plugins"

# Check if tmux is running
if tmux list-sessions >/dev/null 2>&1; then
  # If tmux is running, source the config and install plugins
  tmux source-file "$HOME/.tmux.conf"
  "$HOME/.tmux/plugins/tpm/bin/install_plugins"
  success "Tmux plugins installed"
else
  # If tmux is not running, plugins will be installed on first tmux launch
  info "Tmux not running. Plugins will be installed on first launch."
  info "Or run: ~/.tmux/plugins/tpm/bin/install_plugins"
fi

echo ''
echo "  Tmux setup complete!"
echo "  If tmux was already running, restart your tmux sessions to apply changes"
echo ''

exit 0
