local present, cmp = pcall(require, "cmp")
if not present then
  return
end
local lspkind = require("lspkind")

lspkind.init()

local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.setup {
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
    -- Youtube: How to set up nice formatting for your sources.
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[BUF]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[LUA]",
        path = "[PATH]",
        luasnip = "[SNIP]",
      },
    },
  },
  map_cr = true,
  map_complete = true,
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "nvim_lua" }
  },
}

cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
