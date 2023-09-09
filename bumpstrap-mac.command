#!/bin/bash

# bumpstrap a new mac!

# START HERE:
# https://docs.google.com/document/d/1WtHgFCoUmosud967ybRi483z2fgHdRUTdl9NwYLVyKk



# may need to make adjustments for M1 Apple ARM silicon (based on running old version on Chautauqua)

# Brew may need Rosetta

# This little snippet can overcome Brew error:


# Older Alfred workflows may need Python 2: 
# https://www.alfredapp.com/help/kb/python-2-monterey/ 
# https://github.com/alfredapp/updated-third-party-python2-workflows

# # # To reinstall Python 2:

# export PATH="/opt/homebrew/bin:/usr/local/bin:${PATH}"
# eval "$(brew shellenv)"
# brew install pyenv
# pyenv install 2.7.18
# ln -s "${HOME}/.pyenv/versions/2.7.18/bin/python2.7" "${HOMEBREW_PREFIX}/bin/python"







##### (0) Ready? Preamble:

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
# mkdir ~/Configs

##### (1) 
## install Homebrew using the system Ruby in order to install the new Ruby :-/

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew doctor
brew cleanup

## install gpg  # this avoids cert problems in RVM install -- you may be prompted for password
brew install gpg
command curl -sSL https://rvm.io/mpapis.asc | gpg --import -

##### (2)
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

# create a simlink to NVM current node from default location 
##  https://github.com/moranje/alfred-workflow-todoist/blob/master/README.md#configuration

cd /usr/local/bin; ln -s $(which node) node

# (for Afred + LastPass workflow; see https://github.com/stuartcryan/lastpass-alfred-workflow 
# may need to pprepend sudo 
cpan install Capture::Tiny

## (4)
## install casks!
brew install --cask visual-studio-code
brew install --cask typora
brew install --cask soulver
brew install --cask sizeup
brew install --cask mimestream
brew install --cask imageoptim
brew install --cask google-drive
brew install --cask google-chrome
brew install --cask github
brew install --cask figma
brew install --cask atext
brew install --cask alfred
brew install --cask acorn
brew install --cask makemkv
brew install --cask handbrake
brew install --cask joplin
brew install --cask yt-music
brew install --cask lastpass
# brew install --cask tunnelbear
# brew install --cask sublime-text
# brew install --cask sourcetree
# brew install --cask soundflower
# brew install --cask sketch
# brew install --cask signal
# brew install --cask quicksilver
# brew install --cask plex-media-server
brew install --cask plex
# brew install --cask workflowy
# brew install --cask obs
# brew install --cask nvalt
# brew install --cask numi
# brew install --cask musescore
# brew install --cask karabiner-elements
# brew install --cask google-backup-and-sync
# brew install --cask goodsync
brew install --cask dropbox
# brew install --cask cyberduck
# brew install --cask brave-browser
# brew install --cask box-sync
# brew install --cask balsamiq-mockups
# brew install --cask amazon-workdocs-drive

##  ## Quick Look Extensions  → https://github.com/sindresorhus/quick-look-plugins
##	## maybe add: webpquicklook 
brew install --cask qlstephen qlmarkdown quicklook-json suspicious-package qlvideo qlImageSize

##  ## better than man pages...
brew install tldr

##  ## not sure we need this....
# brew install midnight-commander

## install other stuff 
# github CLI
brew install gh
# "z" beats "cd" most of the time.
brew install z
brew install mackup
brew install ffmpeg

npm install -g npm-check

# AWS
brew install awscli
brew install git-secrets
gem install s3_website_revived  #used to need java 8, so....
# brew tap caskroom/versions
# brew install --cask java8
# ... update: no longer available as a cask
#     but is avail as a download .dmg from oracle
#     install this (from local share _New Mac Xtras)

# LastPass CLI
# brew install lastpass-cli

##  ## Mac App Store CLI
brew install mas
mas lucky MindNode
mas lucky Monosnap
# mas lucky Keynote
# mas lucky OneNote
# mas lucky Logic Pro X
# mas lucky GarageBand
# mas lucky MainStage
# mas lucky OmniGraffle
# mas lucky Evernote

# todoist:
# mas install 585829637

# the unarchiver
# mas install 425424353

# Slack
mas install 803453959

# WhatsApp
# mas install 1147396723
mas lucky whatsapp 

# Subversion (some fonts need this)
brew install svn

####  FONTS  ####
brew tap homebrew/cask-fonts
brew install font-inconsolata
brew install font-open-sans
# brew install font-material-icons

#### loose change ####
# need these for the /rezume project #
# brew install pandoc
# gem install mustache
# npm install -g less