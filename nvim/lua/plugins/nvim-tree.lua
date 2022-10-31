local ntree = require("nvim-tree")

ntree.setup {
  view = {
    side = "right",
    width = 60,
  },
  remove_keymaps = { "s" },
}
local remap = require("../remap")

remap.lua("n", "<Leader>nt", function() ntree.toggle(false, false) end)
remap.lua("n", "<Leader>ff", function() ntree.toggle(true, false) end)
