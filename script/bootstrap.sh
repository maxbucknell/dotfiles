#!/usr/bin/env bash
#
# bootstrap installs things.
# Shamelessly ripped from holman/dotfiles

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd)

set -e

echo ''

info () {
  printf "  [ \033[00;34m..\033[0m ] $1"
}

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

link_file () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then

        skip=true;

      else

        user "File already exists: $(basename "$src"), what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}

install_dotfiles () {
  info 'installing dotfiles'

  local overwrite_all=false backup_all=false skip_all=false

  for src in $(find "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink')
  do
    dst="$HOME/.$(basename "${src%.*}")"
    link_file "$src" "$dst"
  done
}

install_vim_plugins () {
  info "installing vim plugins"

  local PLUGINS=(
    "thoughtbot/pick.vim"
    "tomtom/tlib_vim"
    "mxw/vim-jsx"
    "wting/rust.vim"
    "marcweber/vim-addon-mw-utils"
    "scrooloose/syntastic"
    "mustache/vim-mustache-handlebars"
    "pangloss/vim-javascript"
    "JulesWang/css.vim"
    "genoma/vim-less"
  )
  local BASE_DIR="$DOTFILES_ROOT/vim/vim.symlink/bundle"
  local GIT_HOST="git@github.com"

  rm -fr "$BASE_DIR"
  success "remove existing plugins"

  mkdir -p "$BASE_DIR"

  for i in "${PLUGINS[@]}"
  do
    info "installing $i"
    local BASE_NAME="$(basename $i)"
    git clone "$GIT_HOST:$i" "$BASE_DIR/$BASE_NAME" &> /dev/null
    success "installed $i"
  done
}

install_zsh_plugins () {
  info "installing bash plugins"

  local PLUGINS=(
    "zsh-users/zsh-syntax-highlighting"
    "zsh-users/zsh-completions"
  )
  local BASE_DIR="$DOTFILES_ROOT/zsh/zsh.symlink"
  local GIT_HOST="git@github.com"

  rm -fr "$BASE_DIR"
  success "remove existing plugins"

  mkdir -p "$BASE_DIR"

  for i in "${PLUGINS[@]}"
  do
    info "installing $i"
    local BASE_NAME="$(basename $i)"
    git clone "$GIT_HOST:$i" "$BASE_DIR/$BASE_NAME" &> /dev/null
    success "installed $i"
  done
}

install_vim_plugins
install_zsh_plugins
install_dotfiles

echo '  All installed!'
