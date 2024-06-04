#!/usr/bin/env bash

rbenv install 3.2.2
rbenv global 3.2.2

# Update Rubygems to latest
gem update --system

# Reinstall all gems
gem install \
	rake \
	rspec \
	rubocop \
	ruby-lint
