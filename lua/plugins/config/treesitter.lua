require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "javascript", "lua" },
  sync_install = false,
  auto_install = true,
  highlight = {
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
    filetypes = { "html", "xml", "javascriptreact", "typescriptreact" },
  },
  rainbow = {
    enable = true,
    extended_mode = false,
    max_file_lines = nil,
  },
}
