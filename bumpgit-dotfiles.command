#!/bin/bash

####  PULL THE REPOS for shared dotfiles and dotfiles local (choose the right -BRANCH- for local!)####
# for example:
    # git clone https://idahog@bitbucket.org/bumpux/dotfiles_local.git -b YOUR-BRANCH-NAME-HERE --single-branch ~/Projects/dotfiles_local/

git clone https://idahog@bitbucket.org/bumpux/dotfiles.git ~/Projects/dotfiles/
git clone https://idahog@bitbucket.org/bumpux/dotfiles_local.git -b work-A --single-branch ~/Projects/dotfiles_local/

### MAKE IT SO
# IMPORTANT: verify the mackup config is what you want inside dotfiles_local (PER BRANCH) to avoid ... huh???!?

cd ~/Projects/dotfiles
sh install
mackup restore  -- do this to get all the app configurations restore (via mackup)