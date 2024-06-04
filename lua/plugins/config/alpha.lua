local alpha = require("alpha")
local stats = require("lazy").stats()
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                     ]],
  [[       ████ ██████           █████      ██                     ]],
  [[      ███████████             █████                             ]],
  [[      █████████ ███████████████████ ███   ███████████   ]],
  [[     █████████  ███    █████████████ █████ ██████████████   ]],
  [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
  [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
  [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
  [[                                                                       ]],
}
dashboard.section.header.opts.hl = "AlphaHeader"

local loaded = {
  type = "text",
  val = "Loaded " .. stats.count .. " plugins",
  opts = {
    position = "center",
  }
}

dashboard.section.buttons.val = {
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
  dashboard.button("g", "󰱼  Find word", ":Telescope live_grep<CR>"),
  dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
  dashboard.button("m", "󱌣  Mason", ":Mason<CR>"),
  dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
  dashboard.button("q", "  Exit", ":qa<CR>"),
}

for _, button in ipairs(dashboard.section.buttons.val) do
  button.opts.hl = "AlphaButton"
  button.opts.hl_shortcut = "AlphaButton"
end

dashboard.section.footer.val = {
  '"First, solve the problem. Then, write the code."',
  "                                  - John Johnson"
}
dashboard.section.footer.opts.hl = { { { "AlphaFooter", 0, 49 } }, { { "AlphaButton", 0, 49 } } }

dashboard.config.opts.noautocmd = true
alpha.setup(dashboard.opts)
local opts = {
  layout = {
    { type = "padding", val = 2 },
    dashboard.section.header,
    loaded,
    { type = "padding", val = 2 },
    dashboard.section.buttons,
    { type = "padding", val = 2 },
    dashboard.section.footer,
  },
  opts = {
    position = "center",
    margin = 5
  },
}

require("alpha").setup(opts)
