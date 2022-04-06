local use = require('packer').use
require('packer').startup(function()

  use 'dracula/vim' -- Theme	

  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client

  use 'onsails/lspkind-nvim'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use "lukas-reineke/indent-blankline.nvim"

  use 'simrat39/rust-tools.nvim'
  
  -- Statusline
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  use 'jeffkreeftmeijer/vim-numbertoggle'

  use("windwp/nvim-autopairs")

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

  -- use {'nvim-telescope/telescope-ui-select.nvim' }

end)
