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
 
  -- LSP, LSP installer and tab completion.
  use {
    "neovim/nvim-lspconfig",
    "williamboman/nvim-lsp-installer"
  }

  -- LSP enhancer
  -- { "tami5/lspsaga.nvim" }
  use {
    "tami5/lspsaga.nvim",
    event = "BufRead",
    config = function()
      require("plugins/lspsaga").config()
    end,
    -- disable = not config.enabled.lspsaga,
  }

  use {
    "rafamadriz/friendly-snippets",
    event = "InsertEnter",
  }

  use {
    "hrsh7th/nvim-cmp",
    after = "friendly-snippets",
    requires = {
      "hrsh7th/cmp-nvim-lsp"
    },
    config = function()
      require("plugins/cmp")
    end
  }

  use {
    "L3MON4D3/LuaSnip",
    wants = "friendly-snippets",
    after = "nvim-cmp",
    config = function()
      require("luasnip/loaders/from_vscode").lazy_load()
    end
  }

  use 'onsails/lspkind-nvim'

  use {
    "saadparwaiz1/cmp_luasnip",
    after = "LuaSnip"
  }
  use {
    "hrsh7th/cmp-buffer",
    after = "cmp_luasnip"
  }
  use {
    "hrsh7th/cmp-path",
    after = "cmp-buffer"
  }


  -- Set root directory intelligently
  -- use 'airblade/vim-rooter'

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require("lualine").setup {
        options = {
          theme = "dracula"
        },
      }
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

  use 'AndrewRadev/splitjoin.vim'

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
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    after = "nvim-treesitter"
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

  use "farmergreg/vim-lastplace"

  use 'famiu/bufdelete.nvim'

  -- use {
  --   "akinsho/toggleterm.nvim",
  --   config = function()
  --     require("plugins/toggleterm")
  --   end
  -- }

  use "sheerun/vim-polyglot"
 
  -- Color schemes
  use {
    "dracula/vim",
    as = "dracula",
    config = function() 
      vim.cmd "colo dracula"
    end
  }

  use "pantharshit00/vim-prisma"


end)
