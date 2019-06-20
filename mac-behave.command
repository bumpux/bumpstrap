#!/bin/bash

# tell your Mac what you like

# expand this into a fuller first-run mac script.
# in ScriptsEtc, there is a setup ruby-node script; once this is done, run-up-all to get up to date

# have a section for cask installs:
# brew cask install karabiner-elements 
# ....  ( searc for casks here: https://caskroom.github.io/search)

### baised on matthias and paulirish .dotfiles.

# started from copying stuff from https://github.com/mathiasbynens/dotfiles/blob/master/.macos 


# Set highlight color to green  
# note the weird syntax for color: https://apple.stackexchange.com/questions/156120/applehighlightcolor-syntax/164905 
defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable transparency in the menu bar and elsewhere on Yosemite
# defaults write com.apple.universalaccess reduceTransparency -bool true

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Save screenshots to preferred location (e.g. desktop)
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

###############################################################################
# Finder                                                                      #
###############################################################################

# Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder: when performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

###############################################################################
# Google Chrome & Google Chrome Canary                                        #
###############################################################################

# # Disable the all too sensitive backswipe on trackpads
# defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
# defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

# # Disable the all too sensitive backswipe on Magic Mouse
# defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
# defaults write com.google.Chrome.canary AppleEnableMouseSwipeNavigateWithScrolls -bool false

# Use the system-native print preview dialog
defaults write com.google.Chrome DisablePrintPreview -bool true 
defaults write com.google.Chrome.canary DisablePrintPreview -bool true

# Expand the print dialog by default
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true


###############################################################################
# SizeUp.app                                                                  #
###############################################################################

# Start SizeUp at login
defaults write com.irradiatedsoftware.SizeUp StartAtLogin -bool true

# Don’t show the preferences window on next start
defaults write com.irradiatedsoftware.SizeUp ShowPrefsOnNextStart -bool false


# to get Dock the way you like it run ScriptsEtc/Applescripts/Dock • As You Like It.scpt

# Dark main menu without the rest of dark mode
# 	Set Light mode
# 	defaults write -g NSRequiresAquaSystemAppearance -bool Yes
# 	Log out and log back in
# 	Set Dark mode