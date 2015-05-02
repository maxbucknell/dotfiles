function git_branch
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

