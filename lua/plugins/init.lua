local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy = require 'lazy'
lazy.setup(
  {
    {
      'nvim-treesitter/nvim-treesitter',
      run = ":TSUpdate",
      cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
      config = function() require('plugins.config.treesitter') end
    },
    {
      'windwp/nvim-ts-autotag',
      event = "InsertEnter",
      lazy = true
    },
    {
      "nvim-tree/nvim-web-devicons",
      event = 'BufRead',
      config = function() require('plugins.config.devicons') end,
      lazy = true,
    },
    {
      'goolord/alpha-nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function() require('plugins.config.alpha') end
    },
    {
      'NvChad/nvim-colorizer.lua',
      event = 'BufRead',
      config = function() require('colorizer').setup { user_default_options = { names = false } } end,
      lazy = true
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      opts = {},
      event = "BufReadPost",
      config = function()
        require("ibl").setup()
      end
    },
    {
      "akinsho/toggleterm.nvim",
      lazy = true,
      config = function() require('plugins.config.toggleterm') end,
      cmd = "ToggleTerm",
    },
    {
      'nvim-lua/plenary.nvim',
      lazy = true,
    },
    {
      'kyazdani42/nvim-tree.lua',
      lazy = true,
      cmd = "NvimTreeToggle",
      config = function() require('plugins.config.nvim-tree') end
    },
    {
      'akinsho/bufferline.nvim',
      event = "BufRead",
      dependencies = 'nvim-tree/nvim-web-devicons',
      config = function() require('plugins.config.bufferline') end
    },
    {
      'nvim-lualine/lualine.nvim',
      dependencies = 'nvim-tree/nvim-web-devicons',
      config = function () require('plugins.config.lualine') end
    },
    {
      'nvim-telescope/telescope.nvim',
      cmd = "Telescope",
      lazy = true,
      dependencies = { 'plenary.nvim' },
      config = function() require('plugins.config.telescope') end
    },
    {
      "nvim-telescope/telescope-ui-select.nvim",
      lazy = true
    },
    {
      "terrortylor/nvim-comment",
      config = function()
        require('nvim_comment').setup({ create_mappings = false })
      end
    },
    {
      "lewis6991/gitsigns.nvim",
      lazy = true,
      event = { "BufRead" },
      config = function()
        require('gitsigns').setup {
          signs = {
            add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
            change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
            delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
            topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
            changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
            untracked    = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsDeleteLn' },
          },
        }
      end
    },
    {
      "williamboman/mason.nvim",
      cmd = {
        "MasonInstall",
        "MasonUninstall",
        "Mason",
        "MasonUninstallAll",
        "MasonLog",
      },
      event = "BufRead",
      dependencies = {
        "williamboman/mason-lspconfig.nvim"
      },
      config = function() require('plugins.config.lsp.mason') end,
    },
    {
      "neovim/nvim-lspconfig",
      event = { "BufReadPost", "BufNewFile" },
      lazy = true,
      cmd = { "LspInfo", "LspInstall", "LspUninstall", "LspStart" },
      config = function()
        require "plugins.config.lsp.lspconfig"
      end,
    },

    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      lazy = true,
      dependencies = {
        "onsails/lspkind-nvim",
        {
          "L3MON4D3/LuaSnip",
          lazy = true,
          dependencies = "rafamadriz/friendly-snippets",
          config = function()
            require("plugins.config.lsp.luasnip")
          end,
        },
        {
          "windwp/nvim-autopairs",
          opts = {
            fast_wrap = {},
            disable_filetype = { "TelescopePrompt", "vim" },
          },
          event = "InsertEnter",
          lazy = true,
          config = function(_, opts)
            require("nvim-autopairs").setup(opts)
            local cmp_autopairs = require "nvim-autopairs.completion.cmp"
            require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
          end,
        },

        {
          "saadparwaiz1/cmp_luasnip",
          "hrsh7th/cmp-nvim-lua",
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
        },
      },
      config = function()
        require("plugins.config.lsp.cmp")
      end
    },
    {
      "windwp/nvim-autopairs",
      opts = {
        fast_wrap = {},
        disable_filetype = { "TelescopePrompt", "vim" },
      },
      event = "InsertEnter",
      lazy = true,
      config = function(_, opts)
        require("nvim-autopairs").setup(opts)

        local cmp_autopairs = require "nvim-autopairs.completion.cmp"
        require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end,
    },
    { "wakatime/vim-wakatime", lazy = false },
    {
      "andweeb/presence.nvim",
      lazy = false,
      config = function()
        require("presence").setup()
      end
    }
  },
  {
    ui = {
      size = { width = 0.8, height = 0.8 },
      border = "solid",
      icons = {
        cmd = " ",
        config = "",
        event = "",
        ft = " ",
        init = " ",
        import = " ",
        keys = " ",
        lazy = "鈴 ",
        loaded = "●",
        not_loaded = "○",
        plugin = " ",
        runtime = " ",
        source = " ",
        start = "",
        task = "✔ ",
        list = { "●", "➜", "★", "‒" },
      },
      throttle = 20,
    },
    performance = {
      cache = {
        enabled = true,
        path = vim.fn.stdpath("cache") .. "/lazy/cache",
        ttl = 3600 * 24 * 5,
      },
      reset_packpath = true,
      rtp = {
        disabled_plugins = {
          "2html_plugin",
          "getscript",
          "getscriptPlugin",
          "gzip",
          "netrw",
          "netrwPlugin",
          "netrwSettings",
          "netrwFileHandlers",
          "logipat",
          "matchit",
          "matchparen",
          "tar",
          "tarPlugin",
          "rrhelper",
          "spellfile_plugin",
          "vimball",
          "vimballPlugin",
          "zip",
          "zipPlugin",
          "logipat",
          "matchit",
          "tutor",
          "rplugin",
          "syntax",
          "synmenu",
          "optwin",
          "compiler",
          "bugreport",
          "ftplugin",
          "fzf",
          "tutor_mode_plugin",
          "sleuth",
          "vimgrep"
        },
      },
    },
  }
)
