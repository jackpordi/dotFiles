require("nvim-tree").setup()
local remap = require("../remap")

remap("n", "<Leader>nt", ":NvimTreeToggle <CR>")
