require("lspsaga").init_lsp_saga({
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  code_action_icon = "",
  code_action_prompt = { enable = true, sign = true, sign_priority = 20, virtual_text = false },
  finder_action_keys = {
    open = "e",
    vsplit = "v",
    split = "s",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  code_action_keys = { quit = "<ESC>", exec = "<CR>" },
})
