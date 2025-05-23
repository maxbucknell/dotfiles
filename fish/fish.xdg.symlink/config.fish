# Base Path
set PATH "/usr/local/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin"

source "$HOME/dotfiles/fish/fish.xdg.symlink/hosts/$(uname -s).fish"

# Rust
fish_add_path --global --move --path "$HOME/.cargo/bin"

# Go
set -gx GOPATH "$HOME/go"
set -gx GOBIN "$GOPATH/bin"
fish_add_path --global --move --path "$GOBIN"

# Python

set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

if ! test -f "$HOME/dotfiles/python/venv/bin/activate.fish"
    python3 -m venv "$HOME/dotfiles/python/venv"
end

source "$HOME/dotfiles/python/venv/bin/activate.fish"
set -gx PYTHONPATH "$PYTHONPATH:$HOME/dotfiles/lib/python"

source "$HOME/dotfiles/python/venv/bin/activate.fish"
set -gx PYTHONPATH "$PYTHONPATH:$DOTFILES_PATH/lib/python"

# Local path
fish_add_path --global --move --path "$DOTFILES_PATH/bin" "$DOTFILES_PATH/bin/misc"

# FZF
set -gx FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'

# Git
set -gx GIT_COMMITTER_NAME "$GIT_AUTHOR_NAME"
set -gx GIT_COMMITTER_EMAIL "$GIT_AUTHOR_EMAIL"

set -g __fish_git_prompt_show_informative_status true
set -g __fish_git_prompt_showdirtystate true

# JJ
set -gx JJ_CONFIG "$HOME/.config/jj/config.toml"

# Vim aliases
set -gx EDITOR "vim"
alias vi vim
alias v vim

# Bazel
alias bazel bazelisk

# Bat
alias cat "bat --paging=never"
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Eza
alias ls "eza --git --color=never"

# Vi bindings

# fish_vi_key_bindings

# bind -M insert -m default jk cancel repaint-mode
# set -g fish_sequence_key_delay_ms 200

# Syntax highlighting

fish_config theme choose None

set -g fish_color_user normal
set -g fish_color_cwd normal
set -g fish_color_mode --bold magenta
set -g fish_color_comment green
set -g fish_color_error red
set -g fish_color_history_current magenta
set -g fish_color_quote blue
set -g fish_color_valid_path --bold
set -g fish_color_command --bold
set -g fish_color_time magenta

# Greeting. I don't need a repeating message.
set -g fish_greeting
