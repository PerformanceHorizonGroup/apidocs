#!/usr/bin/env bash
set -e

# Build tools
apt-get update -qq && apt-get install -y build-essential

# Locals
apt-get -y install locales

# Install node
curl -sL https://deb.nodesource.com/setup_6.x | bash -;
apt-get install -y nodejs

# Other tools
apt-get install -y rsync
npm install hercule
npm install speccy@0.0.1
gem install apiaryio
gem install git
