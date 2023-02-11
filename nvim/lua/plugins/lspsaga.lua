local M = {}

function M.config()

  local status_ok, lspsaga = pcall(require, "lspsaga")

  if not status_ok then
    return
  end

  lspsaga.setup({
    symbol_in_winbar = {
      enable = true,
      hide_keyword = true,
      show_file = true,
      folder_level = 1,
      respect_root = false,
      color_mode = true,
    },
  })
end

return M
