#!/usr/bin/fish

set fish_trace 1

sudo apt update
sudo apt full-upgrade

sudo apt-get install curl \
  # A lot of dev apps require a C compiler
  build-essential \
  # For AppImages to work
  fuse libfuse2
