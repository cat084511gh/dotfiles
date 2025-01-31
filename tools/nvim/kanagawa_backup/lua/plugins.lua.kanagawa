return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'


  -- color-scheme
  use "rebelot/kanagawa.nvim"
  require("kanagawa").load("dragon")

  -- Filer
  use "nvim-tree/nvim-tree.lua"
  require("nvim-tree").setup()

  -- status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          globalstatus = true,
        }
      })
    end
  }

  -- file search
  use {
    'ibhagwan/fzf-lua',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- coc
  use {
    'neoclide/coc.nvim',
    branch = "release"
  }

  -- trailing white space
  use "bronson/vim-trailing-whitespace"

  -- indent
  use "Yggdroot/indentLine"

  --git
  use "lewis6991/gitsigns.nvim"
  require('gitsigns').setup()

end)

