local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

vim.cmd('packadd packer.nvim')
local packer = require 'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

packer.startup(function() 
  use {'wbthomason/packer.nvim'}
  use {'dracula/vim', as = 'dracula'}
end)
