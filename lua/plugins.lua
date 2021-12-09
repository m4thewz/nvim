local fn, cmd = vim.fn, vim.cmd
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
local installed = fn.empty(fn.glob(install_path))

if installed > 0 then
  print('Packer is not installed, cloning it now...')
  cmd ('silent !git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

cmd 'packadd packer.nvim'

require('packer').startup(function(use)
  use {'wbthomason/packer.nvim', opt = true}

  use {
    "kyazdani42/nvim-web-devicons",
    config = [[ require 'after.icons' ]]
  }
  use {
    'kyazdani42/nvim-tree.lua',
    cmd = "NvimTreeToggle",
    requires = "kyazdani42/nvim-web-devicons",
    config = [[ require 'after.tree' ]]
  }

  use {
    'akinsho/bufferline.nvim',
    requires = "kyazdani42/nvim-web-devicons",
    config = [[ require 'after.bufferline' ]]
  }
  use {
    "famiu/feline.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = [[ require 'after.feline' ]]
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "javascript", "lua", "css", "scss", "html", "vue" },
        highlight = {
          enable = true,
          use_languagetree = true,
        },
      }
    end,
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
      require("indent_blankline").setup {
        indentLine_enabled = 1,
        char = "▏",
        filetype_exclude = {
           "help",
           "terminal",
           "packer",
           "lspinfo",
        },
        buftype_exclude = { "terminal" },
        show_trailing_blankline_indent = false,
        show_first_indent_level = false,
      }
    end,
  }

  use {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    config = [[ require 'after.cmp' ]],
    requires = {
      'onsails/lspkind-nvim',
      { 'hrsh7th/cmp-buffer', event = "InsertEnter" },
      { 'hrsh7th/cmp-path', event = "InsertEnter" },
      { 'saadparwaiz1/cmp_luasnip', event = "InsertEnter"},
      { 'hrsh7th/cmp-nvim-lua', event = "InsertEnter"},
      {
        'L3MON4D3/LuaSnip',
        event = "Insertenter",
        requires = 'rafamadriz/friendly-snippets',
        config = [[ require("luasnip.loaders.from_vscode").load() ]]
      }
    }
  }

  use {
    'neovim/nvim-lspconfig',
    event = "BufReadPre",
    config = [[ require 'after.lsp' ]],
    requires = {
      { 'tami5/lspsaga.nvim', branch = 'nvim51' },
      'folke/lsp-colors.nvim',
      'hrsh7th/cmp-nvim-lsp'
    }
  }

   use {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    setup = [[ require 'utils'.lazy_load('gitsigns.nvim') ]],
    config = function()
      require('gitsigns').setup {
        sign_priority = 5,
        signs = {
          add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
          change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
          changedelete = { hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr" },
          delete = { hl = "DiffDelete", text = "│", numhl = "GitSignsDeleteNr" },
        },
      }
    end
  }

  use {
    'terrortylor/nvim-comment',
    config = [[ require('nvim_comment').setup() ]]
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = [[ require('colorizer').setup() ]]
  }

  use { 'wakatime/vim-wakatime', event = "InsertEnter" }
end)

if installed > 0 then cmd 'PackerInstall' end
