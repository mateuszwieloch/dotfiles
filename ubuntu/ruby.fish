#!/usr/bin/env fish

asdf plugin add ruby
asdf install ruby latest
asdf global ruby latest

ln -s ~/code/mateuszwieloch/dotfiles/.rspec ~/.rspec
ln -s ~/code/mateuszwieloch/dotfiles/.irbrc ~/.irbrc
ln -s ~/code/mateuszwieloch/dotfiles/.gemrc ~/.gemrc
ln -s ~/code/mateuszwieloch/dotfiles/.pryrc ~/.pryrc
ln -s ~/code/mateuszwieloch/dotfiles/.rubocop.yml ~/.rubocop.yml

gem install solargraph
solargraph download-core
