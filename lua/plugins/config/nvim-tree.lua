require 'nvim-tree'.setup {
  renderer = {
    root_folder_label = false,
    indent_markers = {
      enable = true,
    },
    icons = {
      glyphs = {
        default = ' ',
        symlink = ' ',
        git = {
          untracked = " ",
        }
      },
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = false,
      }
    }
  },
  actions = {
    open_file = {
      quit_on_open = true,
      window_picker = {
        exclude = {
          filetype = {
            "packer",
            "qf"
          },
          buftype = {
            "terminal",
            "help"
          }
        },
      },
    },
  },
  filters = {
    custom = { '.git', 'node_modules', '.cache', '__pycache__' },
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  hijack_directories = { enable = true },
  view = {
    width = "15%",
    side = "left",
  },
}
vim.cmd [[
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
]]
