function fcd --description 'Find a directory using fzf and cd into it'
  set res (find . -type d -name "*" | command fzf)
  if test -n "$res"
    cd $res
  end
end
