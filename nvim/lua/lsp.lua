local lspconfig = require'lspconfig'

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.tsserver.setup {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.document_range_formatting = false
  end,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern(".git")
}

lspconfig.eslint.setup {
  on_attach = function (client, bufnr)
    -- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
    -- the server capabilities of the eslint server ourselves!
    client.server_capabilities.documentFormattingProvider = true
  end,
  settings = {
    format = { enable = true }, -- this will enable formatting
    capabilities = capabilities,
  },
}

lspconfig.prismals.setup {
  on_attach = function (client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
  end,
  settings = {
    format = { enable = true }, -- this will enable formatting
    capabilities = capabilities,
  },
}

lspconfig.sumneko_lua.setup{
  on_attach = function (client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
  end,
  settings = {
    format = { enable = true }, -- this will enable formatting
    capabilities = capabilities,
  }
}

lspconfig.rust_analyzer.setup {
  on_attach = function (client)
    client.server_capabilities.documentFormattingProvider = true
  end,
  settings = {
    format = { enable = true }, -- this will enable formatting
    capabilities = capabilities,
  }
}



vim.cmd [[ do User LspAttachBuffers ]]

local remap = require "remap"

-- Lsp
local lsp_opts = { noremap=true, silent=true }
remap.lua("n", "L", vim.lsp.buf.hover, lsp_opts)
remap.lua("n", "<C-k>", vim.lsp.buf.signature_help, lsp_opts)
remap.lua("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, lsp_opts)
remap.lua("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, lsp_opts)
remap.lua("n", "<leader>wl", function ()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end,
  lsp_opts)
remap.lua("n", "<leader>D", vim.lsp.buf.type_definition, lsp_opts)
remap.vim("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", lsp_opts)
remap.vim("n", "<leader>do", "<cmd>Lspsaga code_action<cr>", lsp_opts)
remap.vim("n", "gs", "<cmd>Lspsaga signature_help<cr>", lsp_opts)
remap.vim("n", "K", "<cmd>Lspsaga hover_doc<cr>", lsp_opts)
remap.vim("n", "gr","<cmd>Lspsaga lsp_finder<CR>", lsp_opts)
remap.vim("n", "<leader>e", "<cmd>Lspsaga show_line_diagnostics<cr>", lsp_opts)
remap.lua("n", "[d", vim.diagnostic.goto_prev, lsp_opts)
remap.lua("n", "]d", vim.diagnostic.goto_next, lsp_opts)
remap.lua("n", "<leader>fr", function()
  vim.lsp.buf.format({ async = true }) 
end, lsp_opts)
