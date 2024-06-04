local map = function(mode, keys, command, opt)
  local options = { noremap = true, silent = true }

  if opt then options = vim.tbl_extend("force", options, opt) end
  if type(keys) == "table" then
    for _, k in ipairs(keys) do
      vim.api.nvim_set_keymap(mode, k, command, options)
    end
  else
    vim.api.nvim_set_keymap(mode, keys, command, options)
  end
end

vim.g.mapleader = " "
map("n", "<Esc>", ":noh<CR>")
map("n", "<C-s>", ":w<CR>")
map("n", "<C-q>", ":q<CR>")
map('n', '<leader>f', ":lua vim.lsp.buf.format()<CR>")
map("n", "<C-w>", ":bd<CR>")

map("n", { "<A-h>", "<A-Left>" }, "<C-w>h")
map("n", { "<A-l>", "<A-Right>" }, "<C-w>l")
map("n", { "<A-k>", "<A-Up>" }, "<C-w>k")
map("n", { "<A-j>", "<A-Down>" }, "<C-w>j")

map("n", "<A-S-Up>", ":horizontal resize +3<CR>")
map("n", "<A-S-Down>", ":horizontal resize -3<CR>")
map("n", "<A-S-Left>", ":vertical resize -3<CR>")
map("n", "<A-S-Right>", ":vertical resize +3<CR>")

map("n", "<A-;>", ":vsplit<CR>")
map("n", "<A-.>", ":split<CR>")

map("n", "<TAB>", ":BufferLineCycleNext <CR>")
map("n", "<S-Tab>", ":BufferLineCyclePrev <CR>")

map('n', '<C-b>', ':NvimTreeToggle<CR>')
map('n', "<C-'>", ':ToggleTerm<CR>')
map('n', '<C-/>', ':CommentToggle<CR>')
map('v', '<C-/>', ':CommentToggle<CR>')

map('n', '<C-p>', ":Telescope find_files<CR>")
map('n', '<C-o>', ":Telescope oldfiles<CR>")
map('n', '<C-f>', ":Telescope live_grep<CR>")
