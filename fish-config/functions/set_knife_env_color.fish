function set_knife_env_color
	switch $KNIFE_ENV
	case '*dev*'
	  set_color green
	case '*test*'
	  set_color yellow
	case '*preprod*' '*pre-prod*'
	  set_color red
	case '*prod*'
	  set_color -b yellow
	  set_color --bold red
	case '*'
		set_color normal
	end
end

