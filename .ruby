#!/usr/bin/env bash

rbenv install 2.5.1
rbenv global 2.5.1

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
	cookstyle \
	dotenv \
	foodcritic \
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
	terraforming \
	travis \
	trollop \
	unirest
