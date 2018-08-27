function fvim
  set results (fzf)
  if test -n "$results"
    nvim $results
  end
end
