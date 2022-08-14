local ntree = require("nvim-tree")

ntree.setup {
  view = {
    side = "right"
  },
  remove_keymaps = { "s" },
}
local remap = require("../remap")

remap.lua("n", "<Leader>nt", function() ntree.toggle(false, false) end)
