function fvim --description "Find a file and open it in vim"
  set results (find . -name "*" | fzf)
  if test -n "$results"
    nvim $results
  end
end
