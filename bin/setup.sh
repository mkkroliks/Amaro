#!/usr/bin/env bash
export LC_ALL="en_US.UTF-8"

# install gems
bundle install

# cocoapods
bundle exec pod install

# submodules
git submodule update --init --recursive
