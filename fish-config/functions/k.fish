function k --description 'Set KNIFE_ENV'
  set kglob (echo $argv[1] | sed 's/./&*-/g' | sed 's/-$//')
  set kglob "~/.chef/knife/$kglob.rb"
  # pick the shortest match
  set kmatch (eval "ls $kglob | awk '{print length, \$0}' | sort -n | head -n 1 | cut -d ' ' -f 2")
  if test -e "$kmatch"
    set -x KNIFE_ENV (basename $kmatch '.rb')
  else
    echo "nothing matches $kglob"
  end
end