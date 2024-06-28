local M = {}

function M.config()

  local status_ok, lspsaga = pcall(require, "lspsaga")

  if not status_ok then
    return
  end

  lspsaga.setup({
    lightbulb = {
      sign = false,
      debounce = 50,
    },
  })
end

return M
