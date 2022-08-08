require("nvim-tree").setup {
  view = {
    side = "right"
  }
}
local remap = require("../remap")

remap("n", "<Leader>nt", ":NvimTreeToggle <CR>")
