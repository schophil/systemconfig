function fish_prompt
  # Collect git information of the current directory
  set gitinfo (git status -s -b -uno ^ /dev/null | head -n 1)

  # Main
  echo -n (set_color cyan)(prompt_pwd) (set_color red)'❯'(set_color yellow)'❯'
  test $status = 0
  and echo -n (set_color yellow)$gitinfo
  echo -n (set_color green)'❯ '
end
