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
    background = { bg = C.bg },
    buffer_visible = { fg = C.comment, bg = C.bg },
    buffer_selected = { fg = C.white, bg = C.bg, bold = true },

    -- duplicate
    duplicate_selected = { fg = C.white, bg = C.bg, bold = true },
    duplicate_visible = { fg = C.visual, bg = C.bg, bold = true },
    duplicate = { fg = C.visual, bg = C.bg, bold = true },

    -- tabs
    tab = { fg = C.visual, bg = C.bg },
    tab_selected = { fg = C.white, bg = C.bg, bold = true },
    tab_separator = { fg = C.bg, bg = C.bg },
    tab_separator_selected = { fg = C.bg, bg = C.bg },

    tab_close = { fg = C.red, bg = C.bg },
    indicator_visible = { bg = C.bg },
    indicator_selected = { fg = C.purple, bg = C.bg, bold = true },

    -- separators
    separator = { fg = C.bg, bg = C.bg },
    separator_visible = { fg = C.black, bg = C.bg },
    separator_selected = { fg = C.black, bg = C.bg },
    offset_separator = { fg = C.black, bg = C.black },

    -- close buttons
    close_button = { fg = C.visual, bg = C.bg },
    close_button_visible = { fg = C.visual, bg = C.bg },
    close_button_selected = { fg = C.red, bg = C.bg },

    -- Empty fill
    fill = { bg = C.bg },
  },
}
