function fzf
  find . -type f -iname "*" | grep -v ".git/" | command fzf
end
