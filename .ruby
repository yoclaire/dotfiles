#!/usr/bin/env bash

rbenv install 2.0.0-p353
rbenv global 2.0.0-p353

# Uninstall all gems
for i in $(gem list --no-versions); do gem uninstall -aIx "$i"; done

# Update Rubygems to latest
gem update --system

# Reinstall all gems
gem install \
	aws-s3 \
	awsutils \
	berkshelf \
	bourbon \
	bundler \
	capistrano \
	capistrano-ext \
	capistrano-gitflow \
	chef \
	chef-zero \
	colored \
	colorize \
	compass \
	deadweight \
	foodcritic \
	gemfury \
	idid \
	knife-ec2 \
	knife-github-cookbooks \
	less \
	localtunnel \
	markdown2confluence \
	oily_png \
	puppet-lint \
	railsless-deploy \
	rubocop \
	ruby-lint \
	therubyracer \
	twig
