local telescope = require("telescope")

telescope.load_extension 'fzf'
local remap = require("../remap")

telescope.setup{ defaults = { file_ignore_patterns = {"node_modules"} } }

remap("n", "<Leader>b", ":Telescope buffers<CR>")
remap("n", "<C-p>", ":Telescope find_files find_command=rg,--follow,--files<CR>")

remap("n", "<Leader>fw", ":Telescope live_grep<CR>")
remap("n", "<Leader>s", ":Telescope lsp_dynamic_workspace_symbols<CR>")
remap("n", "<Leader>gt", ":Telescope git_status<CR>")
remap("n", "<Leader>tr", ":Telescope treesitter<CR>")
remap("n", "<Leader>cm", ":Telescope git_commits<CR>")
remap("n", "<Leader>fd", ":Telescope find_directories<CR>")
remap("n", "<Leader>fp", ":Telescope media_files<CR>")
remap("n", "<Leader>fh", ":Telescope help_tags<CR>")
remap("n", "<Leader>fo", ":Telescope oldfiles<CR>")
remap("n", "<Leader>th", ":Telescope colorscheme<CR>")

