set exrc
set guicursor=
set relativenumber
set nu
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set hidden
set nohlsearch
set noerrorbells
set nowrap
set ignorecase
set smartcase
set incsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=80
set noswapfile
call plug#begin()
Plug 'BurntSushi/ripgrep'
Plug 'sharkdp/fd'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim',
Plug 'https://github.com/gruvbox-community/gruvbox.git'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'nvim-treesitter/nvim-treesitter'
call plug#end()
colorscheme gruvbox
highlight Normal guibg=none ctermbg=None

let mapleader = " "
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({search = vim.fn.input("Grep for > ")})<CR>


fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup JOHNNY_MF_HILL_
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END


augroup MyColors
autocmd!
autocmd ColorScheme * highlight SignColumn guibg=#193549
autocmd ColorScheme * highlight GitSignsAdd guibg=#193549 guifg=#3ad900
autocmd ColorScheme * highlight GitSignsChange guibg=#193549 guifg=#ffc600
autocmd ColorScheme * highlight GitSignsDelete guibg=#193549 guifg=#ff2600
autocmd ColorScheme * highlight ColorColumn guifg=NONE guibg=#204563 gui=NONE
augroup end
