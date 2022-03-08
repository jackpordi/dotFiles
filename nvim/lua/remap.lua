-- Function for make mapping easier.
local function remap(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

remap("n", "}", ":bnext <CR>")
remap("n", "{", ":bprev <CR>")

return remap
