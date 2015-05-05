# Default path
set PATH /usr/local/bin
set PATH /usr/local/sbin $PATH
set PATH /usr/bin $PATH
set PATH /bin $PATH
set PATH /usr/sbin $PATH
set PATH /sbin $PATH

# MacGPG
set PATH /usr/local/MacGPG2/bin $PATH

# Ruby
set RUBY_VERSION (ruby --version | cut -d " " -f 2 | cut -d "p" -f 1)
set PATH "/usr/local/Cellar/ruby/$RUBY_VERSION/bin" $PATH

# LaTeX!
set PATH /usr/texbin $PATH

# Local path
set PATH ~/.config/bin $PATH

# Composer (PHP)
set PATH ~/.composer/vendor/bin $PATH

# Atom
set PATH $PATH /opt/homebrew-cask/Caskroom/atom/latest/Atom.app/Contents/Resources/app/apm/node_modules/atom-package-manager/bin/apm

# DYLD_LIBRARY_PATH (Rust asked for this)
set DYLD_LIBRARY_PATH "/usr/local/lib" "$DYLD_LIBRARY_PATH"

# For GitHub integration.
# See github.com/github/hub
alias git hub

# Remove the greeting message on startup
set fish_greeting

# Stop less clearing the screen when it quits
alias less "less -X"
alias man "man -P \"less -isX\""

# Make my bloody directories
alias mkdir "mkdir -p"

# Make sl run ls afterwards
alias sl "/usr/local/bin/sl; and ls"

# SSH Agent
#
# Start SSH Agent if it's not already running, and add the
# id_(nice_hostname) identity.
setenv SSH_ENV "$HOME/.ssh/environment"
if [ -n "$SSH_AGENT_PID" ]
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    end
else
    if [ -f $SSH_ENV ]
        . $SSH_ENV > /dev/null
    end
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    else
        start_agent
    end
end


# Fish colour customisations
set fish_color_autosuggestion "-o" "black"
set fish_color_command "-o" "cyan"
set fish_color_param "cyan"
set fish_color_error "red"

