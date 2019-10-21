function fish_prompt
  # set sym "➜"
  set sym "▶"
  # Collect git information of the current directory
  set gitinfo (git status -s -b -uno ^ /dev/null | head -n 1)
  # set gitinfo (string sub -s 4 $gitinfo)
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
    set gitparts (string match -e -r '## ([\w\/\.]+){1}(?:\s?)?(\[.*\])?' $gitinfo)
    # Extract the string like [ahead 1]
    if test "3" = (count $gitparts)
      set gitchanges " $gitparts[3]"
    end

    if test (count $gitparts) = "2"; or test (count $gitparts) = "3"
      # The branch information is either the name of one (local) branch or a local branch followed by the name of a remote branch.
      # In the latter the local and remote branch names are separated by 2 dots
      # Example: mybranch...orgin/remote/branch
      set gitbranches (string split '...' $gitparts[2])
      if test (count $gitbranches) = "2"
        # The tilde will indicate that the branch is tracked
        set gitinfo "$gitbranches[1]~$gitchanges"
      else
        set gitinfo "$gitbranches[1]$gitchanges"
      end
    else
      set -e gitinfo
    end
    echo -n ' '$gitinfo" $sym "
  end
  if test -z "$gitinfo"
    echo -n "$sym "
  end
end
