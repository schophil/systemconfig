function fish_prompt
  # set -g sym "➜"
  set -g sym "▶"
  # Collect git information of the current directory
  set -g gitinfo (git status -s -b -uno ^ /dev/null | head -n 1)
  # set -g gitinfo (string sub -s 4 $gitinfo)
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
    set -g gitparts (string match -e -r '## ([\w\/]+){1}(?:\.\.\.[\w\/]+\s?)?(\[.*\])?' $gitinfo)
    if test "3" = (count $gitparts)
      set -g gitinfo "$gitparts[2] $gitparts[3]"
    else if test "2" = (count $gitparts)
      set -g gitinfo "$gitparts[2]"
    else 
      set -e gitinfo
    end
    echo -n ' '$gitinfo" $sym "
  end
  if test -z "$gitinfo"
    echo -n "$sym "
  end
  # echo -n (set_color green)'❯ '
end
