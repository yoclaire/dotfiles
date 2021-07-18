#!/usr/bin/env bash

rbenv install 3.0.1
rbenv global 3.0.1

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
