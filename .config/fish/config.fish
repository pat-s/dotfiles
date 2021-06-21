# abbreviations

#####

alias R 'R --no-save'
alias r "r41"
alias git-sub-up "git submodule update --remote --merge"
alias imp "impressive -c memory -t WipeLeft -ff --noclicks --nowheel --fade"
abbr n "n -x"
alias vi "nvim"

# edit configs
alias fcf "nvim ~/.config/fish/config.fish"
alias vcf "nvim ~/.config/nvim/init.vim"
alias paper2 "nvim ~/git/phd/2019-feature-selection/code/98-paper/ieee/ieee-manuscript.tex"
abbr rmrf "rm -rf"

#####
# VPN
#####

alias vpnc "/opt/cisco/anyconnect/bin/vpn connect vpn.uni-jena.de -s < ~/.credentials"
alias vpnd "/opt/cisco/anyconnect/bin/vpn disconnect vpn.uni-jena.de"

alias ockill "sudo killall -SIGINT openconnect && tmuxinator stop edi"
alias sonicwallkill "sudo killall -SIGINT startct.sh"

alias vpnsnf "sudo openfortivpn -c ~/.config/openfortivpn/snf"

#####
# Git
#####

abbr ga "git add"
abbr ph "git push"
abbr pu "git pull"
abbr gc 'git commit -m'
abbr gunst "git reset HEAD"
abbr gdiff "git diff"
abbr gst "git status"
abbr gs "git switch"
abbr gmm "git merge main"
abbr gsm "git switch main"
abbr grh "git reset --hard origin/main"
abbr gr "git restore"
abbr gbd "git branch -D"
abbr gl "git log"

####
# R
####

alias rs 'rswitch'
alias install-rdev 'bash ~/.scripts/unix/install-rdev.sh'
alias install-rmac 'bash ~/.scripts/unix/install-r-mac4.sh'
alias rup 'export UPDATE_R=true && R -e "remotes::update_packages(ask = FALSE)" && export UPDATE_R=""'
alias r40 'rswitch 4.0 && export R_36=false && radian'
alias r41 'rswitch 4.1 && export R_36=false && radian'
alias rdev 'rswitch 4.2 && export R_36=false && radian'

####
# python
####

alias py35 "/usr/local/opt/python@3.5/bin/python3.5"
alias py36 "/usr/local/opt/python@3.6/bin/python3.6"
alias py37 "/usr/local/opt/python@3.7/bin/python3.7"
alias py38 "/usr/local/opt/python@3.8/bin/python3.8"
alias py39 "/usr/local/opt/python@3.9/bin/python3.9"
alias py "python"
alias py3 "python3"

###
# terraform
###

alias tf "terraform"
alias tfa "terraform apply"

#####
# yadm
#####

alias ya "yadm add"
alias yc "yadm commit -m "
alias yph "yadm push"
alias ypu "yadm pull"
alias ys "yadm status"
alias yd "yadm diff"
alias yaa "yadm add -u"
alias yaac "yadm add -u && yadm commit -m 'update dotfiles' && yadm push"

####
# homebrew
####

alias bup "brew upgrade && brew cleanup"
alias rst "brew reinstall rstudio-daily"
alias rst-ubuntu "wget https://www.rstudio.org/download/latest/daily/desktop/bionic/rstudio-latest-amd64.deb \
  && sudo dpkg -i rstudio-latest-amd64.deb && rm rstudio-latest-amd64.deb"

if test -f '(brew --prefix)'/bin/brew-file
  source '(brew --prefix)'/bin/brew-file
end

#####
# tmux
#####

abbr --add mux "tmuxinator"
alias mss "/opt/cisco/anyconnect/bin/vpn connect vpn.uni-jena.de -s < ~/.credentials && tmuxinator start edi"
alias mssalt "cat .credentials | sudo openconnect -b -u bi28yuv@uni-jena.de --passwd-on-stdin vpn.uni-jena.de && tmuxinator start edi"
alias mssu "tmuxinator start edi"
alias msc "/opt/cisco/anyconnect/bin/vpn disconnect vpn.uni-jena.de && tmuxinator stop edi"
alias mscu "tmuxinator stop edi"
set -gx ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX "YES"

#####
# default env vars
#####

set -gx TERM "xterm-256color"
set -gx EDITOR "nvim"
#set -gx R_HOME "/Library/Frameworks/R.framework/Resources"
set -gx LANG "en_US.UTF-8"
set -gx LC_ALL "en_US.UTF-8"
set -gx GPG_TTY "'(tty)'"
set -e JAVA_HOME

# adds `~/.scripts` and all subdirectories to $PATH
set -e fish_user_paths
set -U fish_user_paths ~/.cargo/bin /usr/local/opt/ccache/libexec /usr/local/bin ~/usr/local/sbin /.scripts/tools /usr/local/lib/ruby/gems/*/bin /usr/local/opt/ruby/bin ~/.scripts/nnn ~/git/nnn/scripts/nlaunch ~/.local/bin ~/git/nnn/plugins ~/.scripts/R $fish_user_paths

#####
# nnn
#####

#set -gx NNN_BMS "d:~/Downloads;g:~/git;f:~/.config/nnn/edi/papers/2019-feature-selection;p:~/.config/nnn/edi/papers/2018-model-comparison;"
set -gx NNN_OPS_PROG "1"
set -gx NNN_RESTRICT_NAV_OPEN "1"
set -gx NNN_TRASH "1"
set -gx NNN_COLORS  "62354"
set -gx NNN_FCOLORS 'c1e2272e006033f7c6d6abc4'
#set -gx NNN_SCRIPT "$HOME/.scripts/nnn"
set -gx NNN_SSHFS "sshfs -o reconnect,idmap=user"
set -gx NNN_PLUG 'i:imgview;d:dragdrop;j:autojump;o:-fzopen;c:fzcd;k:-pskill;p:preview-tui'
set --export NNN_FIFO "/tmp/nnn.fifo"

abbr update_nnn "cd ~/git/nnn && git pull && sudo make O_NERD=1 && sudo make install"

####
# docker
####

abbr dl "docker logs"
abbr dls "docker ps -a"
abbr dsa "docker container stop (docker container list -q)"
abbr dip "docker image prune -y"
abbr dcp "docker container prune -y"
abbr dsh "docker exec -it"
abbr dcop "docker-compose pull"
abbr dcou "docker-compose up -d"
abbr dex  "docker exec -it"

#####
# AWS
#####

set -gx AWS_DEFAULT_PROFILE cynkra-saml
# AWS ECR Login
abbr awsecr "aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 222488041355.dkr.ecr.eu-central-1.amazonaws.com"

#####
# misc
#####

### py-organize-tool
set -gx ORGANIZE_CONFIG ".config/organize/config.yaml"

### fish
alias fr "omf reload"

# spack fish shell completion
set hostnamelocal (hostname)
if [ $hostnamelocal = "edi" ]
  . /opt/spack/share/spack/setup-env.fish
end

# vi mode
fish_vi_key_bindings

# disable radian coloring
set -gx PROMPT_TOOLKIT_COLOR_DEPTH "DEPTH_4_BIT"

ulimit -n 1024

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# GNU tools first in $PATH (overrides the native macOS ones!)
set -g fish_user_paths "/usr/local/opt/make/libexec/gnubin:/usr/local/opt/grep/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin" $fish_user_paths

### Drone
export DRONE_SERVER=https://drone.cynkra.com
export DRONE_TOKEN=RsksV4J8MZC5kdI5yh6V3ehvhMNfJbqz
abbr drone-down 'exo vm stop -f drone'
abbr drone-up 'exo vm start drone'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.fish.inc' ]; . '$HOME/google-cloud-sdk/path.fish.inc'; end

### GPG
set -x GPG_TTY (tty)
#set -x SSH_AUTH_SOCK ~/.gnupg/S.gpg-agent.ssh

set unamestr (uname)
if [ $unamestr = "Darwin" ]
  gpgconf --launch gpg-agent
end
