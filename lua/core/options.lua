local cmd = vim.cmd
local opt = vim.opt
local diagnostic = vim.diagnostic
local g = vim.g

cmd('autocmd BufEnter * set formatoptions-=cro')
cmd('autocmd BufEnter * setlocal formatoptions-=cro')
cmd('set lazyredraw')
cmd('set nolist')

opt.fileencoding = 'utf-8'
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.cursorline = false
opt.laststatus = 3
opt.splitbelow = true
opt.list = true
opt.splitright = true
opt.termguicolors = true
opt.tabline = ' '
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 0
opt.autoindent = true
opt.expandtab = true
opt.backup = false
opt.number = true
opt.numberwidth = 3
opt.ruler = false
opt.updatetime = 250
opt.timeoutlen = 100
opt.hlsearch = true
opt.ignorecase = true
opt.scrolloff = 0
opt.sidescrolloff = 5
opt.shadafile = "NONE"
opt.shadafile = ""
opt.writebackup = false
opt.undofile = true
opt.swapfile = false
opt.showmode = false
opt.whichwrap:append "<>[]hl"
opt.fillchars:append 'eob: '
opt.listchars:append "space: "
opt.shortmess:append "sI"
diagnostic.config { signs = false }
g.loaded_python3_provider = 0
g.code_action_menu_window_border = 'single'

