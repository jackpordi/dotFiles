local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

require("lazy").setup({

  -- LSP, LSP installer and tab completion.
  "neovim/nvim-lspconfig",

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  {
    "glepnir/lspsaga.nvim",
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require("plugins/lspsaga").config()
    end,
  },

  {
    "rafamadriz/friendly-snippets",
    event = "InsertEnter",
  },

  "hrsh7th/cmp-nvim-lsp",

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      'saadparwaiz1/cmp_luasnip',
      "friendly-snippets",
    },
    config = function()
      require("plugins/cmp")
    end
  },

  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "nvim-cmp",
      "friendly-snippets"
    },
    config = function()
      require("luasnip/loaders/from_vscode").lazy_load()
      require("luasnip/loaders/from_vscode").load({ paths = { "~/.local/share/nvim/site/pack/packer/opt/friendly-snippets" } })
      vim.cmd [[ 
        inoremap <silent> <C-j> <cmd>lua require'luasnip'.jump(1)<Cr>
        inoremap <silent> <C-k> <cmd>lua require'luasnip'.jump(-1)<Cr>
      ]]
    end
  },

  'onsails/lspkind-nvim',
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",

  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("lualine").setup {
        options = {
          theme = "dracula",
          globalstatus = true,
        },
      }
    end
  },

  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end
  },

  -- Smooth scroll
  {
    'karb94/neoscroll.nvim',
    config = function()
      require("neoscroll").setup {
        easing_function = "quadratic"
      }
    end
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup()
    end
  },

  -- TreeSitter.
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufRead",
    config = function()
      require("plugins/treesitter")
    end
  },

  -- Auto closes.
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end
  },

  -- This is for html and it can autorename too!
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter" },
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },

  -- use 'AndrewRadev/splitjoin.vim'
  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter' },
    config = function()
      require('treesj').setup({
        use_default_keymaps = false,
      })
      vim.keymap.set("n", "gJ", ":TSJJoin<CR>")
      vim.keymap.set("n", "gS", ":TSJSplit<CR>")
    end,
  },

  -- Icons.
    "nvim-tree/nvim-web-devicons",

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'plugins/nvim-tree'
    end
  },

  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        patterns = { ".git", "package.json" },
      }
    end
  },

  {
    "akinsho/bufferline.nvim",
    dependencies  = { "nvim-web-devicons" },
    config = function()
      require("bufferline").setup {
        options = {
          show_buffer_icons = true,
          show_buffer_close_icons = true,
        }
      }
    end
  },

   {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end
  },

  "tpope/vim-fugitive",

  -- Commentary replacement
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    dependencies = { "nvim-treesitter"}
  },

  -- Pretty colors
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
  },

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("plugins/telescope")
    end
  },

  "farmergreg/vim-lastplace",

  "famiu/bufdelete.nvim",

  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("plugins/toggleterm")
    end
  },

  -- Color schemes
  {
    'Mofiqul/dracula.nvim',
    config = function()
      local dracula = require("dracula")
      dracula.setup()
      vim.cmd "colo dracula"
    end
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons"},
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },

  "pantharshit00/vim-prisma",

  { 'alexghergh/nvim-tmux-navigation',
    config = function()
      require 'nvim-tmux-navigation'.setup {
        disable_when_zoomed = true, -- defaults to false
        keybindings = {
          left = "<C-h>",
          down = "<C-j>",
          up = "<C-k>",
          right = "<C-l>",
          -- last_active = "<C-\\>",
          next = "<C-Space>",
        }
      }
    end
  },

  "jxnblk/vim-mdx-js",

  {
    'echasnovski/mini.ai',
    config = function()
      require "mini.ai".setup()
    end
  },

  -- {
  --   "nvim-neotest/neotest",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "antoinemadec/FixCursorHold.nvim",
  --     'haydenmeade/neotest-jest',
  --   },
  --   config = function()
  --     require('neotest').setup({
  --       adapters = {
  --         require('neotest-jest')({
  --           jestCommand = "yarn test --",
  --           jestConfigFile = "jest.config.ts",
  --           env = { CI = true },
  --           cwd = function(path)
  --             return vim.fn.getcwd()
  --           end,
  --         }),
  --       }
  --     })
  --   end
  -- },

  {
    "danymat/neogen",
    config = function()
      require('neogen').setup {}
      local opts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)
    end,
    dependencies = {"nvim-treesitter/nvim-treesitter"},
  },

  {
    "stevearc/aerial.nvim",
    config = function ()
      require("plugins.aerial")
    end
  },

  -- {
  --   'pwntester/octo.nvim',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-telescope/telescope.nvim',
  --     'nvim-tree/nvim-web-devicons',
  --   },
  --   config = function ()
  --     require"octo".setup()
  --   end
  -- },

})
