-- Function for make mapping easier.
local function _vim(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function lua(mode, lhs, func, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend("force", options, opts) end

  options = vim.tbl_extend("force", options, {
    callback = func,
  })
  vim.api.nvim_set_keymap(mode, lhs, "", options)
end

local remap = {
  vim = _vim,
  lua = lua,
}

remap.vim("n", "L", ":bnext <CR>")
remap.vim("n", "H", ":bprev <CR>")

return remap
