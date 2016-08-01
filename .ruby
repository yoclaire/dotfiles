#!/usr/bin/env bash

rbenv install 2.3.1
rbenv global 2.3.1

# Uninstall all gems
for i in $(gem list --no-versions); do gem uninstall -aIx "$i"; done

# Update Rubygems to latest
gem update --system

# Reinstall all gems
gem install \
	aws-sdk
	aws-s3 \
	awsutils \
	bourbon \
	bundler \
	colored \
	colorize \
	compass \
	gemfury \
	idid \
	et-knife-ec2 \
	less \
	localtunnel \
	markdown2confluence \
	oily_png \
	puppet-lint \
	railsless-deploy \
	rubocop \
	ruby-lint \
	therubyracer
