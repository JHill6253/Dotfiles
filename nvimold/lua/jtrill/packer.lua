-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use( 'wbthomason/packer.nvim')
  use( 'BurntSushi/ripgrep')
  use( 'sharkdp/fd')
  use( 'nvim-lua/plenary.nvim')
  use( 'nvim-lua/popup.nvim')
  use( 'nvim-telescope/telescope.nvim')
  use( 'morhetz/gruvbox')
  use( 'vim-airline/vim-airline')
  use( 'preservim/nerdtree')
  use( 'scrooloose/nerdcommenter')
  use( 'nvim-treesitter/nvim-treesitter')
  use( 'ryanoasis/vim-devicons' )
  use( 'sheerun/vim-polyglot' )
  use('sainnhe/vim-color-forest-night')
end)


