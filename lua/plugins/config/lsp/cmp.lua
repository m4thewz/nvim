local cmp = require("cmp")
local icons = {
  Namespace = "󰌗",
  Text = "󰉿",
  Method = "󰆧",
  Function = "󰆧",
  Constructor = "",
  Field = "󰜢",
  Variable = "󰀫",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "󰑭",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈚",
  Reference = "󰈇",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "󰙅",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰊄",
  Table = "",
  Object = "󰅩",
  Tag = "",
  Array = "[]",
  Boolean = "",
  Number = "",
  Null = "󰟢",
  String = "󰉿",
  Calendar = "",
  Watch = "󰥔",
  Package = "",
  Copilot = "",
  Codeium = "",
  TabNine = "",
}

cmp.setup {
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<S-Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
    ["<S-Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
    ["<S-Tab>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
    ["<Tab>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
    ["<S-u>"] = cmp.mapping.scroll_docs(-4),
    ["<S-d>"] = cmp.mapping.scroll_docs(4),
    ["<S-Space>"] = cmp.mapping.complete(),
    ["<S-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  formatting = {
    fields = { "abbr", "kind" },
    format = function(_, item)
      local a = string.rep(" ", 10)
      item.abbr = item.abbr .. a
      item.kind = icons[item.kind] .. " " .. item.kind
      return item
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
  window = {
    documentation = cmp.config.window.bordered({
      winhighlight = "NormalFloat:CmpPmenu,FloatBorder:FloatBorder",
    }),
  }
}
