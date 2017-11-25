function fish_prompt
	test $SSH_TTY
    and printf (set_color red)$USER(set_color brwhite)'@'(set_color yellow)(prompt_hostname)' '
    test $USER = 'root'
    and echo (set_color red)"#"	

    block -g
    set gitinfo (git status -s -b -uno ^ /dev/null)

    # Main
    echo -n (set_color cyan)(prompt_pwd) (set_color red)'❯'(set_color yellow)'❯'
    test $status = 0
    and echo -n (set_color yellow)$gitinfo
    echo -n (set_color green)'❯ '
end
