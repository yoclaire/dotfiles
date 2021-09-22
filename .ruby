#!/usr/bin/env bash

rbenv install 3.0.2
rbenv global 3.0.2

# Update Rubygems to latest
gem update --system

# Reinstall all gems
gem install \
	mdl \
	oily_png \
	pry \
	rake \
	rspec \
	rubocop \
	ruby-lint
