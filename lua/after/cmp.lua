local cmp = require("cmp")
local lspkind = require("lspkind")
local kinds = vim.lsp.protocol.CompletionItemKind

local icons = {
  Class = "",
  Color = "",
  Constant = "",
  Constructor = "",
  Enum = "練",
  EnumMember = "",
  Field = "",
  File = "",
  Folder = "",
  Function = "",
  Interface = "ﰮ",
  Keyword = "",
  Method = " ",
  Module = " ",
  Property = "ﰠ",
  Snippet = "",
  Struct = "ﳤ",
  Text = "",
  Unit = "",
  Value = "",
  Variable = "",
  Reference = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

lspkind.init({ with_text = true })

for i, kind in ipairs(kinds) do
  kinds[i] = icons[kind] or kind
end

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = function(_, item)
      item.kind = " " .. icons[item.kind]
      item.menu = nil

      return item
    end
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
  },
})
