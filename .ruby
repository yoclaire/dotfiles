#!/usr/bin/env bash

rbenv install 2.3.1
rbenv global 2.3.1

# Uninstall all gems
for i in $(gem list --no-versions); do gem uninstall -aIx "$i"; done

# Update Rubygems to latest
gem update --system

# Reinstall all gems
gem install \
	aws-sdk \
	awsutils \
	bourbon \
	bundler \
	cloudflare-dns-update \
	colored \
	colorize \
	compass \
	less \
	oily_png \
	rubocop \
	ruby-lint
