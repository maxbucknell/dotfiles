set -g __fish_prompt_hostname (hostname|cut -d . -f 1)

function __fish_prompt_git_branch
  set __git_branch (git current-branch ^ /dev/null)

  if test -z $__git_branch
    return
  else if test $__git_branch = HEAD
    set __rev (git log -1 --oneline ^ /dev/null)
    if not test -z $__rev
      echo -n (git log -1 --oneline | cut -d " " -f 1)
    end
  else
    echo -n $__git_branch
  end
end

####
# Fish prompt
# Looks like: user@host in cwd(branch)
function fish_prompt

  # Reset button
  set_color normal

  #
  # Username
  #

  # Show root user as red, to remind us of danger.
  if test (whoami) = root
    set_color red
  else
    set_color yellow
  end

  echo -n (whoami)

  # Connecting pieces ("@", "in", "(", ")") are black.
  set_color normal
  set_color -o black

  echo -n @

  #
  # Hostname
  #

  # To remove boldness
  set_color normal
  set_color blue

  echo -n (hostname)

  set_color normal
  set_color -o black

  echo -n " in "

  #
  # Current working dir
  #

  set_color normal
  set_color red

  echo -n (pwd | rev | cut -d "/" -f 1 | rev)

  set_color normal
  set_color -o black

  #
  # Git branch
  #

  set branch (__fish_prompt_git_branch)
  if not test -z $branch
    echo -n "("

    set_color normal
    set_color green

    echo -n "$branch"

    set_color normal
    set_color -o black

    echo -n ")"
  end

  echo ""
  echo -n "→ "

  set_color normal
end
