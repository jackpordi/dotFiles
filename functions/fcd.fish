function fcd --description 'Find a directory using fzf and cd int it'
  cd (find . -type d -name "*" | command fzf)
end
