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
    code_action = {
      num_shortcut = true,
      show_server_name = false,
      extend_gitsigns = false,
      keys = {
        -- string | table type
        quit = "q",
        exec = "<CR>",
      },
    },
  })
end

return M
