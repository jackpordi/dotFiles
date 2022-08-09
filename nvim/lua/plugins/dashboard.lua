local db = require "dashboard"

local home = os.getenv('HOME')

db.preview_file_height = 12
db.preview_file_width = 80
db.custom_center = {
  {icon = '  ',
    desc = 'Recently opened files                   ',
    action =  'Telescope oldfiles',
  },
  {
    icon = '  ',
    desc = 'Find  File                              ',
    action = 'Telescope find_files find_command=rg,--files',
  },
  {
    icon = '  ',
    desc ='File Browser                            ',
    action =  'Telescope file_browser',
  },
  {
    icon = '  ',
    desc = 'Find  word                              ',
    action = 'Telescope live_grep',
  },
  {
    icon = '  ',
    desc = 'Open Neovim Config                  ',
    action = 'Telescope dotfiles path=' .. home ..'/.config/nvim/lua',
  },
}
