local use = require('packer').use
require('packer').startup(function()

  use 'dracula/vim' -- Theme

  -- Statusline
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client

  use 'onsails/lspkind-nvim'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use "lukas-reineke/cmp-rg"

  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-omni'
  use({"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"})

  use {
    'saecki/crates.nvim',
    tag = 'v0.2.1',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('crates').setup()
    end,
  }

  use "rafamadriz/friendly-snippets"

  use "lukas-reineke/indent-blankline.nvim"

  -- set relatrive line numbers only when current buffer is selected
  use 'jeffkreeftmeijer/vim-numbertoggle'

  use 'airblade/vim-gitgutter'

  -- =====================
  -- CODING TOOLS
  -- =====================

  use("windwp/nvim-autopairs")

  use 'tpope/vim-commentary'

  use 'simrat39/rust-tools.nvim'

  -- Latex support
  use("lervag/vimtex")

  -- =====================
  -- TELESCOPE
  -- =====================
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" }, { "nvim-lua/popup.nvim" } },
  })
  use({
    "romgrk/fzy-lua-native",
    requires = { { "nvim-telescope/telescope.nvim" } },
  })

  use ({
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    requires = { { "nvim-telescope/telescope.nvim" } }
  })

  use {'nvim-telescope/telescope-ui-select.nvim' }

  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      {'tami5/sqlite.lua', module = 'sqlite'},
      {'nvim-telescope/telescope.nvim'},
    },
    config = function()
      require('neoclip').setup()
    end,
  }

  use {
    "brymer-meneses/grammar-guard.nvim",
    requires = {
        "neovim/nvim-lspconfig",
        "williamboman/nvim-lsp-installer"
    }
  }

  use 'tpope/vim-repeat'

end)
