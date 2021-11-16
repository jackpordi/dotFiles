local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

vim.cmd('packadd packer.nvim')
local packer = require 'packer'
local util = require'packer.util'

packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

local remap = require 'remap'

packer.startup(function() 
  -- Self-manage packer
  use {'wbthomason/packer.nvim'}

  -- Color schemes
  use {'dracula/vim', as = 'dracula'}
  use {'flazz/vim-colorschemes'}

  -- Set root directory intelligently
  use 'airblade/vim-rooter'

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
        require("lualine").setup()
    end
  }

  -- Lightspeed - similar to vim-sneak
  use 'ggandor/lightspeed.nvim'

  -- Smooth scroll
  use {
    'karb94/neoscroll.nvim',
    config = function()
        require("neoscroll").setup {
            easing_function = "quadratic"
        }
    end
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("indent_blankline").setup {
            buftype_exclude = { "terminal" }
        }
    end
  }

  -- TreeSitter.
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = "BufRead",
    cmd = {
      "TSInstall",
      "TSInstallSync",
      "TSBufEnable",
      "TSBufToggle",
      "TSEnableAll",
      "TSInstallFromGrammer",
      "TSToggleAll",
      "TSUpdate",
      "TSUpdateSync"
    },
    config = function()
      require("plugins/treesitter")
    end
  }

  -- Auto closes.
  use {
    "windwp/nvim-autopairs",
    config = function()
       require("nvim-autopairs").setup()
    end
  }

  -- This is for html and it can autorename too!
  use {
    "windwp/nvim-ts-autotag",
    after = "nvim-treesitter",
    config = function()
       require("nvim-ts-autotag").setup()
    end
  }

  -- Icons.
  use {
    "kyazdani42/nvim-web-devicons",
    event = "BufEnter"
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() 
      require 'plugins/nvim-tree'
    end
  }

  use {
    "akinsho/bufferline.nvim",
    after = "nvim-web-devicons",
    config  = function()
      require("bufferline").setup {
        show_buffer_icons = true,
        show_buffer_close_icons = true,
      }
    end
  }

  use "tpope/vim-surround"
  use "tpope/vim-fugitive"

  -- Commentary replacement
  use {
    "terrortylor/nvim-comment",
    config = function()
        require("nvim_comment").setup()
    end
  }

  -- Pretty colors
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup()
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
    config = function()
        require("plugins/telescope")
    end
  }
end)
