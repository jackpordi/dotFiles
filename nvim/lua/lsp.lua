local lspconfig = require'lspconfig'

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.tsserver.setup {
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  end,
  capabilities = capabilities
}

lspconfig.eslint.setup {
  on_attach = function (client, bufnr)
    -- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
    -- the server capabilities of the eslint server ourselves!
    client.server_capabilities.document_formatting = true
  end,
  settings = {
    format = { enable = true }, -- this will enable formatting
    capabilities = capabilities,
  },
}

lspconfig.prismals.setup {
  on_attach = function (client, bufnr)
    client.server_capabilities.document_formatting = true
  end,
  settings = {
    format = { enable = true }, -- this will enable formatting
    capabilities = capabilities,
  },
}

vim.cmd [[ do User LspAttachBuffers ]]

local remap = require "remap"

-- Lsp
local lsp_opts = { noremap=true, silent=true }
remap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", lsp_opts)
remap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", lsp_opts)
remap("n", "L", ":lua vim.lsp.buf.hover()<CR>", lsp_opts)
remap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", lsp_opts)
remap("n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>", lsp_opts)
remap("n", "<leader>wa", ":lua vim.lsp.buf.add_workspace_folder()<CR>", lsp_opts)
remap("n", "<leader>wr", ":lua vim.lsp.buf.remove_workspace_folder()<CR>", lsp_opts)
remap("n", "<leader>wl", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", lsp_opts)
remap("n", "<leader>D", ":lua vim.lsp.buf.type_definition()<CR>", lsp_opts)
remap("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", lsp_opts)
remap("n", "<leader>do", "<cmd>Lspsaga code_action<cr>", lsp_opts)
remap("n", "gh", "<cmd>Lspsaga lsp_finder<cr>", lsp_opts) -- A bit broken atm
remap("n", "gs", "<cmd>Lspsaga signature_help<cr>", lsp_opts)
remap("n", "K", "<cmd>Lspsaga hover_doc<cr>", lsp_opts)
-- remap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", lsp_opts)
remap("n", "gr","<cmd>Lspsaga lsp_finder<CR>", lsp_opts)
remap("n", "<leader>e", "<cmd>Lspsaga show_line_diagnostics<cr>", lsp_opts)
remap("n", "[d", ":lua vim.lsp.diagnostic.goto_prev()<CR>", lsp_opts)
remap("n", "]d", ":lua vim.lsp.diagnostic.goto_next()<CR>", lsp_opts)
remap("n", "<leader>q", ":lua vim.lsp.diagnostic.set_loclist()<CR>", lsp_opts)
remap("n", "<leader>fr", ":lua vim.lsp.buf.format({ async = true })<CR>", lsp_opts)
