#!/usr/bin/env bash
set -e

# Build tools
apt update -qq && apt install -y build-essential

# Locals
apt-get -y install locales
export LC_ALL=C.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Install node
curl -sL https://deb.nodesource.com/setup_6.x | bash -;
apt install -y nodejs

# Other tools
apt install -y rsync
npm install hercule
gem install apiaryio
gem install git
