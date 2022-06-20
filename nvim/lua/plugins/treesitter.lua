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

require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  },
  -- rainbow = {
  --   enable = true,
  --   -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
  --   extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  --   max_file_lines = nil, -- Do not enable for files with more than n lines, int
  --   -- colors = {}, -- table of hex strings
  --   -- termcolors = {} -- table of colour name strings
  -- }
}

vim.cmd
[[
autocmd BufEnter * set foldmethod=expr
autocmd BufEnter * set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99
]]
