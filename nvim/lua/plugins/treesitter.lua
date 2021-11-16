local nvim_treesitter = require "nvim-treesitter.configs" 

nvim_treesitter.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  matchup = {
    enable = true,
  },
  indent = {
    enable = true
  },
  autotag = {
    enable = true
  }
}

vim.cmd
[[
autocmd BufEnter * set foldmethod=expr
autocmd BufEnter * set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99
]]
