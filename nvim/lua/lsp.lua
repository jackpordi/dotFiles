local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}


  if server.name == "tsserver" then
    opts.on_attach = function(client)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
    end
  end

  opts.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
  server:setup(opts)

  vim.cmd [[ do User LspAttachBuffers ]]
end)

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
remap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", lsp_opts)
remap("n", "gr", ":lua vim.lsp.buf.references()<CR>", lsp_opts)
remap("n", "<leader>e", ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", lsp_opts)
remap("n", "[d", ":lua vim.lsp.diagnostic.goto_prev()<CR>", lsp_opts)
remap("n", "]d", ":lua vim.lsp.diagnostic.goto_next()<CR>", lsp_opts)
remap("n", "<leader>q", ":lua vim.lsp.diagnostic.set_loclist()<CR>", lsp_opts)
remap("n", "<leader>fr", ":lua vim.lsp.buf.formatting()<CR>", lsp_opts)
