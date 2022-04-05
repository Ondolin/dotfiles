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

  use 'simrat39/rust-tools.nvim'
  
  -- Statusline
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  use 'jeffkreeftmeijer/vim-numbertoggle'

  use("windwp/nvim-autopairs")

end)
