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

  echo -n (nice_hostname)

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

  set branch (git_branch)
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
