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

function fish_prompt
  if test (whoami) = root; set_color red; else; set_color black; end
  echo -n  (set_color yellow)(whoami)(set_color black)@(set_color blue)(hostname)(set_color black)

  echo -n ' in' (set_color red)(pwd | rev | cut -d "/" -f 1 | rev)(set_color black)

  set __prompt_branch (__fish_prompt_git_branch)
  if not test -z $__prompt_branch; echo -n \((set_color green)$__prompt_branch(set_color black)\); end

  echo ""
  echo -n '→' (set_color normal)

end
