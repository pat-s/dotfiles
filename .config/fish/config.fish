#####
# abbreviations
#####

abbr mymount 'bash ~/mymount.sh'
abbr servers 'bash ~/tilix_all.sh'
abbr R '/usr/bin/R --no-save'
abbr r "radian"
abbr git-sub-up "git submodule update --remote --merge"
abbr imp "impressive -c memory -t WipeLeft -ff --noclicks --nowheel --fade"
abbr ss "sudo systemctl"

# edit configs
abbr fcf "nvim ~/.config/fish/config.fish"
abbr icf "nvim ~/.config/i3/config"
abbr vcf "nvim ~/.config/nvim/init.vim"
abbr scf "nvim ~/.config/sway/config"
abbr ncf "nvim ~/.config/nvim/init.vim"

# pacman
abbr t "trizen"
abbr tup "trizen -Syu"

#####
# Git
#####

abbr ga "git add"
abbr gp "git push"
abbr gc "git commit -m"
abbr gunst "git reset HEAD"
abbr gdiff "git diff"
abbr gs "git status"

#####
# st
#####

alias std "xrdb ~/.xresources/gruvbox-dark.xresources"
alias stl "xrdb ~/.xresources/gruvbox-light.xresources"

#####
# yadm
#####

abbr ya "yadm add"
abbr yc "yadm commit -m '"
abbr yp "yadm push"
abbr ys "yadm status"

#####
# tmux
#####

abbr --add mux "tmuxinator"

#####
# default env vars
#####

set -gx TERM "xterm-256color"
set -gx EDITOR "nvim"
set -gx READER "zathura"
set -gx TERMINAL "st"
set -gx BROWSER "firefox"
set -gx BIB "~/Documents/Bibliography.bib"
set -gx MYVIMRC "~/.config/nvim/init.vim"
set -gx BEMENU_BACKEND "wayland"
set -gx SUDO_ASKPASS "~/.scripts/tools/dmenupass"

# adds `~/.scripts` and all subdirectories to $PATH
set -e fish_user_paths
set -U fish_user_paths ~/git/nnn/scripts/nlaunch ~/.scripts/i3cmds/  ~/.scripts/tools ~/.local/bin ~/git/nnn/plugins ~/.scripts/R $fish_user_paths

#####
# nnn
#####

set -gx NNN_BMS "g:~/git;c:/mnt/cluster/home/patrick;f:/mnt/cluster/home/patrick/papers/2019-feature-selection;l:/mnt/lossa/data_mccoy_kirk_scotty/patrick;r:/home/pjs/git/rcourses;p:/mnt/cluster/home/patrick/papers/2018-model-comparison"
set -gx NNN_CP_MV_PROG "1"
#set -gx NNN_USE_EDITOR "1"
set -gx NNN_OPENER "mimeo"
set -gx NNN_OPS_PROG "1"
set -gx NNN_RESTRICT_NAV_OPEN "1"
set -gx NNN_TRASH "1"
set -gx NNN_CONTEXT_COLORS  "1234"
set -gx NNN_SCRIPT "/home/pjs/.scripts/nnn"
set -gx NNN_COPIER '~/.scripts/nnn/copy-sel-to-clipboard'

#####
# misc
#####

# aur auto vote
set -gx AUR_AUTO_VOTE_PASSWORD "aI479rsAPyUZ72IQy"

# fish
abbr fr "omf reload"

# wallpaper
abbr wallp "feh --bg-scale"

# R
set -gx R_HOME "/usr/lib64/R"

# vi mode
fish_vi_key_bindings

