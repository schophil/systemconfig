function fish_prompt
  # set -g sym "➜"
  set -g sym "▶"
  # Collect git information of the current directory
  set -g gitinfo (git status -s -b -uno ^ /dev/null | head -n 1)
  ## don't show the first 2 # characters
  set -g gitinfo (string sub -s 4 $gitinfo)
  # First set a profile name if present
  if test -n "$sub"
    echo -n (set_color grey)"$sub $sym"
  end
  if test -z "$sub"
    echo -n (set_color grey)"$sym"
  end
  # Main
  echo -n (set_color cyan)' '(prompt_pwd) "$sym"(set_color yellow)
  if test -n "$gitinfo"
    echo -n ' '$gitinfo" $sym "
  end
  if test -z "$gitinfo"
    echo -n "$sym "
  end
  # echo -n (set_color green)'❯ '
end
