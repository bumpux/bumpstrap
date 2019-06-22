#!/bin/bash

# bumpstrap a new mac!

# first brush up on this doc:
# https://docs.google.com/document/d/1WtHgFCoUmosud967ybRi483z2fgHdRUTdl9NwYLVyKk/edit#heading=h.yh7nthgzg9xn 

# 0. preamble 
# 1. install homebrew
# 2. setup Ruby + RVM
# 3. and Node + NVM
# 4. brew cask install lots of apps you need
# 5. pull down dotfiles and mackup configs
# 6. run scripts to sync all the things

## (0) 
## get ready

# assumes up to date Xcode and Git, and permission to run as sudo
# deeper: http://railsapps.github.io/installrubyonrails-mac.html 
xcode-select --install

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


# FIRST take charge of pesky /usr/local/*    # this appears no longer to be needed (old homebrew workaround)
# sudo chown -R $(whoami) /usr/local

## lay some groundwork
mkdir ~/Projects
mkdir ~/Clouds

## (1) 
## install Homebrew using the system Ruby in order to install the new Ruby :-/

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew doctor
brew cleanup

## install gpg  # this avoids cert problems in RVM install -- you may be prompted for password
brew install gpg
command curl -sSL https://rvm.io/mpapis.asc | gpg --import -

## (2)
## install RVM and Ruby

curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -

\curl -L https://get.rvm.io | bash -s stable --autolibs=enabled --ruby
source ~/.rvm/scripts/rvm

## finalize Ruby
gem update --system
rvm gemset use global
gem update
echo "gem: --no-document" >> ~/.gemrc
gem install bundler

# install Jekyll
gem install jekyll

## (3)
## install node and NVM

## install Node Version Manager
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash

## activate it for this session
. ~/.nvm/nvm.sh

## install and default to latest node
nvm install node
nvm alias default node

## You *may* need to add these lines to your ~/.bashrc, ~/.profile, 
## or ~/.zshrc file to have it automatically sourced upon login. 
## update- the install adds the lines to .bashrc, which Macs don't load by default
## so adding them to .profile

echo 'export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm' >>~/.profile

# what are we using?
nvm current

# (for Afred + LastPass workflow; see https://github.com/stuartcryan/lastpass-alfred-workflow 
# may need to pprepend sudo 
cpan install Capture::Tiny

## (4)
## install casks!
brew cask install alfred
brew cask install google-backup-and-sync
brew cask install google-chrome
brew cask install dropbox
brew cask install sizeup
brew cask install cyberduck
brew cask install sketch
brew cask install sublime-text
brew cask install visual-studio-code
brew cask install typora
brew cask install nvalt
brew cask install quicksilver
brew cask install numi
brew cask install sourcetree
brew cask install visual-studio-code
brew cask install box-sync
brew cask install atext
brew cask install imageoptim
brew cask install musescore
# brew cask install karabiner-elements
# brew cask install balsamiq-mockups
# brew cask install signal
# brew cask install goodsync

##  ## Quick Look Extensions  → https://github.com/sindresorhus/quick-look-plugins
##	## maybe add: webpquicklook 
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json suspicious-package qlvideo qlImageSize

##  ## better than man pages...
brew install tldr

##  ## not sure we need this....
# brew install midnight-commander

## install other stuff 

# z beats cd most of the time.
brew install z
brew install mackup

npm install -g npm-check

# AWS
brew install awscli
gem install s3_website  #needs java, so....
brew tap caskroom/versions
brew cask install java8

# LastPass CLI
brew install lastpass-cli

##  ## Mac App Store CLI
brew install mas
mas lucky MindNode
mas lucky Monosnap
mas lucky Keynote
mas lucky OneNote
# mas lucky Logic Pro X
mas lucky GarageBand
mas lucky MainStage
# mas lucky OmniGraffle