#!/usr/bin/env bash

rbenv install 2.6.1
rbenv global 2.6.1

# Update Rubygems to latest
gem update --system

# Reinstall all gems
gem install \
	aws-sdk \
	awsutils \
	bitters \
	bourbon \
	bump \
	cloudflare-dns-update \
	colored \
	colorize \
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
	ruby-lint \
	optimist \
	unirest
