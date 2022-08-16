local telescope = require("telescope")

telescope.load_extension 'fzf'
local remap = require("../remap")

telescope.setup { defaults = { file_ignore_patterns = { "node_modules" } } }
telescope.load_extension('projects')

local builtins = require('telescope.builtin');

remap.lua("n", "<Leader>b", builtins.buffers)

local find_files = function()
  builtins.find_files({ find_command = {"rg", "--follow", "--files"} })
end
remap.lua("n", "<C-p>", find_files)

remap.lua("n", "<Leader>fw", builtins.live_grep)
remap.lua("n", "gd", builtins.lsp_definitions)
remap.lua("n", "gi", builtins.lsp_implementations)
remap.lua("n", "gt", builtins.lsp_type_definitions)
remap.lua("n", "<Leader>S",  builtins.lsp_dynamic_workspace_symbols)
remap.lua("n", "<Leader>s",  builtins.lsp_document_symbols)
remap.lua("n", "<Leader>gt", builtins.git_status)
remap.lua("n", "<Leader>tr", builtins.treesitter)
remap.lua("n", "<Leader>fh", builtins.help_tags)
remap.lua("n", "<Leader>fo", builtins.oldfiles)
remap.lua("n", "<Leader>th", builtins.colorscheme)
