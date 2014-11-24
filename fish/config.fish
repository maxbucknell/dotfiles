# Default path
set PATH /usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin /usr/local/MacGPG2/bin

# Ruby support
set PATH /usr/local/Cellar/ruby/2.1.3/bin $PATH

# LaTeX!
set PATH /usr/texbin $PATH

# Local path
set PATH ~/.config/bin $PATH

# For GitHub integration.
# See github.com/github/hub
alias git hub

# I don't want to delete things anymore.
alias rm trash

# Remove the greeting message on startup
set fish_greeting

# Stop less clearing the screen when it quits
alias less "less -X"
alias man "man -P \"less -isX\""

# Make my bloody directories
alias mkdir "mkdir -p"

# Make sl run ls afterwards
alias sl "/usr/local/bin/sl; and ls"