# If we're on a Mac, let's install and setup homebrew.
if [ "$(uname -s)" == "Darwin" ]
then
  # Do something under Mac OS X platform

  # Upgrade homebrew
  echo "› brew update"
  brew update

  # Set macOS defaults
  $ZSH/macos/set-defaults.sh
fi

