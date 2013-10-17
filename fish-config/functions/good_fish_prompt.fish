function fish_prompt --description 'Write out the prompt'
	set -l last_status $status

  printf '↪  '
  # User
  if test !(whoami) = 'juozas'
    set_color $fish_color_user
    echo -n (whoami)
    set_color normal

    echo -n '@'

    # Host
    set_color $fish_color_host
    echo -n (hostname -s)
    set_color normal

    echo -n ':'
  end

  # PWD
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal

  __terlar_git_prompt

  if not test $last_status -eq 0
    set_color $fish_color_error
  end

  set_color $fish_color_user
  echo -n ' ✱  '
  set_color normal
end
