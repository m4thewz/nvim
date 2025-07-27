local colors = require 'core.colors'

colors.one_bg = "#373844"
colors.lightbg = "#343642"
colors.lightbg2 = "#2f313d"
colors.teal = "#0088cc"

local modes = {
  ["n"] = { "NORMAL", colors.blue },
  ["no"] = { "N-PENDING", colors.red },
  ["i"] = { "INSERT", colors.bright_magenta },
  ["ic"] = { "INSERT", colors.bright_magenta },
  ["t"] = { "TERMINAL", colors.green },
  ["v"] = { "VISUAL", colors.cyan },
  ["V"] = { "V-LINE", colors.cyan },
  [""] = { "V-BLOCK", colors.cyan },
  ["R"] = { "REPLACE", colors.orange },
  ["Rv"] = { "V-REPLACE", colors.orange },
  ["s"] = { "SELECT", colors.bright_magenta },
  ["S"] = { "S-LINE", colors.bright_magenta },
  [""] = { "S-BLOCK", colors.bright_magenta },
  ["c"] = { "COMMAND", colors.yellow },
  ["cv"] = { "COMMAND", colors.green },
  ["ce"] = { "COMMAND", colors.green },
  ["r"] = { "PROMPT", colors.teal },
  ["rm"] = { "MORE", colors.teal },
  ["r?"] = { "CONFIRM", colors.teal },
  ["!"] = { "SHELL", colors.green },
}

local function get_current_mode_color()
  local current_mode = vim.api.nvim_get_mode().mode
  return modes[current_mode][2]
end

local function file_icon()
  local filename = vim.fn.expand "%:t"
  local extension = vim.fn.expand "%:e"
  local icon = require("nvim-web-devicons").get_icon(filename, extension)
  return icon and " " .. icon .. " " or "  "
end

local theme = {
  normal = {
    a = { bg = "None" },
    b = { bg = "None" },
    c = { bg = "None" },
    x = { bg = "None" },
    y = { bg = "None" },
    z = { bg = "None" },
  },
  insert = {
    a = { bg = "None" },
    b = { bg = "None" },
    c = { bg = "None" },
    x = { bg = "None" },
    y = { bg = "None" },
    z = { bg = "None" },
  },
  visual = {
    a = { bg = "None" },
    b = { bg = "None" },
    c = { bg = "None" },
    x = { bg = "None" },
    y = { bg = "None" },
    z = { bg = "None" },
  },
  replace = {
    a = { bg = "None" },
    b = { bg = "None" },
    c = { bg = "None" },
    x = { bg = "None" },
    y = { bg = "None" },
    z = { bg = "None" },
  },
  command = {
    a = { bg = "None" },
    b = { bg = "None" },
    c = { bg = "None" },
    x = { bg = "None" },
    y = { bg = "None" },
    z = { bg = "None" },
  },
  inactive = {
    a = { bg = "None" },
    b = { bg = "None" },
    c = { bg = "None" },
    x = { bg = "None" },
    y = { bg = "None" },
    z = { bg = "None" },
  },
}

require('lualine').setup {
  options = {
    theme = theme,
    component_separators = '',
    section_separators = '',
    globalstatus = true,
    disabled_filetypes = { statusline = {} },
    always_divide_middle = false,
  },
  sections = {
    lualine_a = {
      {
        "mode",
        color = function()
          return { bg = get_current_mode_color(), fg = colors.one_bg, gui = "bold"}
        end,
        padding = { left = 1, right = 1 },
      },
    },
    lualine_b = {
      {
        function ()
          local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
          return " 󰉋 " .. dir_name .. " "
        end,
        color = { fg = colors.grey_fg },
        padding = { left = 1, right = 0 },
      },
      {
        "branch",
        icon = " ",
        color = { fg = colors.grey_fg, bg = colors.statusline },
        padding = { left = 0, right = 0 },
      },
    },
    lualine_c = {
      {
        "diff",
        symbols = { added = " ", modified = " ", removed = " " },
        diff_color = {
          added = { fg = colors.grey_fg },
          modified = { fg = colors.grey_fg },
          removed = { fg = colors.grey_fg },
        },
        color = { bg = colors.statusline },
        padding = { left = 1, right = 1 },
      },
    },
    lualine_x = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", hint = " ", info = " " },
        diagnostics_color = {
          error = { fg = colors.red },
          warn = { fg = colors.yellow },
          hint = { fg = colors.cyan },
          info = { fg = colors.green },
        },
        color = { bg = colors.statusline },
        padding = { left = 1, right = 1 },
      },
      {
        function()
          if next(vim.lsp.buf_get_clients(0)) ~= nil then
            return file_icon() .. vim.lsp.buf_get_clients(0)[1].name
          else
            return ""
          end
        end,
        color = { fg = colors.grey_fg, bg = colors.statusline},
        padding = { left = 0, right = 1 },
      },
    },
    lualine_y = {
      {
        "progress",
        color = { fg = colors.grey_fg },
        padding = { left = 0, right = 1 }
      },
    },
    lualine_z = {
      {
        "location",
        color = function()
          return { fg = colors.statusline, bg = get_current_mode_color(), gui = "bold"}
        end,
        padding = { left = 1, right = 1 },
      },
    },
  },
}
