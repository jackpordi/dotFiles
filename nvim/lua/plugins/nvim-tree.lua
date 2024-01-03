local ntree = require("nvim-tree")

ntree.setup {
  view = {
    side = "right",
    width = 60,
  },
  -- remove_keymaps = { "s" },
}
local remap = require("../remap")

local ntree_api = require("nvim-tree.api");

remap.lua("n", "<Leader>nt", function() ntree_api.tree.toggle(false, false) end)
remap.lua("n", "<Leader>ff", function() ntree_api.tree.toggle(true, false) end)
