#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

brew tap Homebrew/bundle

brew bundle

# Set up GNU core utilities (those that come with OS X are outdated).
echo 'Be sure to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.'
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

if ! grep '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Remove outdated versions from the cellar.
brew cleanup
