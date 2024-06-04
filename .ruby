#!/usr/bin/env bash

rbenv install 3.3.1
rbenv global 3.3.1

# Update Rubygems to latest
gem update --system

# Reinstall all gems
gem install \
	rake \
	rspec \
	rubocop \
	ruby-lint
