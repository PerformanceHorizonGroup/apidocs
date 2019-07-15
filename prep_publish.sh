#!/usr/bin/env bash
set -e

# Build tools
apt-get update -qq && apt-get install -y build-essential

# Locals
apt-get -y install locales

# Install node
curl -sL https://deb.nodesource.com/setup_12.x | bash -
apt-get install -y nodejs

# Other tools
apt-get install -y rsync
npm install --no-save hercule
gem install apiaryio
gem install git
