local C = require 'core.colors'

require("bufferline").setup {
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = " " .. vim.fn.getcwd():gsub("^(/home/[^/]+)", "~"),
        text_align = "left",
        highlight = "NvimTreeBufferLabel",
      }
    },
    buffer_close_icon = "",
    modified_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    close_icon = "",
    show_close_icon = true,
    max_name_length = 14,
    max_prefix_length = 13,
    tab_size = 20,
    show_tab_indicators = true,
    enforce_regular_tabs = false,
    view = "multiwindow",
    show_buffer_close_icons = true,
    separator_style = "thin",
    always_show_bufferline = true,
    diagnostics = false,
  },
  highlights = {
    -- buffers
    background = { bg = C.menu },
    buffer_visible = { fg = C.visual, bg = C.menu },
    buffer_selected = { fg = C.white, bg = C.bg, bold = true },

    -- duplicate
    duplicate_selected = { fg = C.white, bg = C.bg, bold = true },
    duplicate_visible = { fg = C.visual, bg = C.menu, bold = true },
    duplicate = { fg = C.visual, bg = C.menu, bold = true },

    -- tabs
    tab = { fg = C.visual, bg = C.menu },
    tab_selected = { fg = C.white, bg = C.bg, bold = true },
    tab_separator = { fg = C.menu, bg = C.menu },
    tab_separator_selected = { fg = C.menu, bg = C.bg },

    tab_close = { fg = C.red, bg = C.menu },
    indicator_visible = { bg = C.menu },
    indicator_selected = { fg = C.purple, bg = C.bg, bold = true },

    -- separators
    separator = { fg = C.menu, bg = C.menu },
    separator_visible = { fg = C.black, bg = C.menu },
    separator_selected = { fg = C.black, bg = C.menu },
    offset_separator = { fg = C.black, bg = C.black },

    -- close buttons
    close_button = { fg = C.visual, bg = C.menu },
    close_button_visible = { fg = C.visual, bg = C.menu },
    close_button_selected = { fg = C.red, bg = C.bg },

    -- Empty fill
    fill = { bg = C.menu },
  },
}
