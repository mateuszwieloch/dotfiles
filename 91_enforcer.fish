#!/usr/bin/env fish

brew install git-lfs

if rg "artifactory.uber.internal" /etc/hosts
  echo "/etc/hosts already contains artifactory.uber.internal"
else
  echo '127.0.0.1 artifactory.uber.internal' | sudo tee -a /etc/hosts
end

brew tap adoptopenjdk/openjdk
brew cask install adoptopenjdk/openjdk/adoptopenjdk8

if rg "set -gx JAVA_HOME /usr/libexec/java_home -v 1.8" ~/.config/fish/config.fish
  echo "JAVA_HOME already set to Java 8"
else
  echo "set -gx JAVA_HOME /usr/libexec/java_home -v 1.8" >> ~/.config/fish/config.fish
end

brew install cassandra

if not test -d ~/schema-service-repo
  git clone gitolite@code.uber.internal:data/schema-service-repo
end
