function fish_prompt
  # Collect git information of the current directory
  set -l gitinfo (git status -s -b -uno ^ /dev/null | head -n 1)

  # Main
  echo -n (set_color cyan)(prompt_pwd) '❯'(set_color yellow)
  if test -n "$gitinfo"
    echo -n ' '$gitinfo' ❯ '
  end
  if test -z "$gitinfo"
    echo -n '❯ '
  end
  # echo -n (set_color green)'❯ '
end
