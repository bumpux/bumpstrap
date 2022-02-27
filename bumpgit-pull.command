#!/bin/bash

# A U T H 
gh auth login

# D O T F I L E S
git clone https://github.com/bumpux/dotfiles.git ~/Projects/dotfiles
git clone https://github.com/bumpux/dotfiles_local.git -b telluride --single-branch ~/Projects/dotfiles_local
## Install 
cd ~/Projects/dotfiles
sh install
### Lastly, restore configs saved by Mackup for dotfiles/local (DIR specified in dotfiles_local/mackup.cfg)
mackup restore

# O T H E R    S T U F F
# Script this later. For now, just open GH Desktop and pull the things you need into ~/Projects/

# Later, when .dotfiles_local are in place, use this method to auth from token instead of interactively via browser
    # gh auth login --with-token < ~/Projects/dotfiles_local/github/tokens/repo 














# OLD OLD OLD

####  PULL MORE REPOS 

# git clone https://idahog@bitbucket.org/idahog/scriptsetc.git ~/Projects/scriptsetc/
# git clone https://idahog@bitbucket.org/idahog/sketch-data.git ~/Projects/sketch-data/
# # git clone https://bumpux@bitbucket.org/bumpux/songwright.org.git ~/Projects/songwright.org/
# # git clone https://bumpux@github.com/bumpux/bumpstrap.git ~/Projects/bumpstrap/
# git clone https://idahog@bitbucket.org/idahog/bplex.git ~/Projects/bplex/



# #test - IT WORKS WITH PUBLIC, NOT PRIVATE... SCOPES?
# git clone https://${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}:x-oauth-basic@github.com/bumpux/prosody.git ~/Projects/prosody/
# git clone https://${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}:x-oauth-basic@github.com/bumpux/rezume.git ~/Projects/rezume/


# # CLI with token based on: https://sysadmins.co.za/clone-a-private-github-repo-with-personal-access-token/


# gh auth login --with-token < ~/Projects/dotfiles_local/github/tokens/repo
