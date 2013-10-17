function fish_right_prompt -d "Write out the right prompt"
  set ts (date "+[%H:%M:%S]")
  if test -n $KNIFE_ENV
  	set_color blue
  	echo -n '['
		set_knife_env_color
    echo -n $KNIFE_ENV
    set_color blue
  	echo -n ']'
    set_color normal
  end
  echo ' ' $ts
end
