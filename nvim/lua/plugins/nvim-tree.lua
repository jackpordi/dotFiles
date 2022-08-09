require("nvim-tree").setup {
  view = {
    side = "right"
  },
  remove_keymaps = { "s" },
}
local remap = require("../remap")

remap("n", "<Leader>nt", ":NvimTreeToggle <CR>")
