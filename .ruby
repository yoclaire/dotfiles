#!/usr/bin/env bash

rbenv install 2.5.0
rbenv global 2.5.0

# Uninstall all gems
for i in $(gem list --no-versions); do gem uninstall -aIx "$i"; done

# Update Rubygems to latest
gem update --system

# Reinstall all gems
gem install \
	aws-sdk \
	awsutils \
	bitters \
	bourbon \
	bump \
	bundler \
	cloudflare-dns-update \
	coffee-script \
	colored \
	colorize \
	compass \
	dotenv \
	gh \
	highline \
	less \
	neat \
	normalize-scss \
	octokit \
	oily_png \
	pry \
	rake \
	rspec \
	rubocop \
	rubocop \
	ruby-lint \
	sass \
	terraforming \
	travis \
	trollop \
	unirest
