-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local function bootstrap_pckr()
    local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

    if not vim.loop.fs_stat(pckr_path) then
        vim.fn.system({
            'git',
            'clone',
            "--filter=blob:none",
            'https://github.com/lewis6991/pckr.nvim',
            pckr_path
        })
    end
    vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add{
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    }
}
    --{
    --'nvim-telescope/telescope.nvim', tag = '0.1.5',
-- o--r                              , branch = '0.1.x',
    --  dependencies = { 'nvim-lua/plenary.nvim' }
    --}
--  --  ({
--        'rose-pine/neovim',
--        as = 'rose-pine'})
--
--        ({
--            'sainnhe/everforest',
--            as = 'everforest',
--        })
--        ({
--            'morhetz/gruvbox',
--            as='gruvbox',
--            config = function()
--                vim.cmd('colorscheme gruvbox')
--                vim.cmd("highlight Normal guibg=none ctermbg=None")
--            end
--        })
--        ({ -- Autocompletion
--        'hrsh7th/nvim-cmp',
--        dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
--    })
--    ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
--    ('nvim-treesitter/playground')
--    ('theprimeagen/harpoon')
--    ('mbbill/undotree')
--    ('tpope/vim-fugitive')
--    ('theprimeagen/vim-be-good')
--    {
--        'VonHeikemen/lsp-zero.nvim',
--        requires = {
--            -- LSP Support
--            {'neovim/nvim-lspconfig'},
--            {'williamboman/mason.nvim'},
--            {'williamboman/mason-lspconfig.nvim'},
--
--            -- Autocompletion
--            {'hrsh7th/nvim-cmp'},
--            {'hrsh7th/cmp-buffer'},
--            {'hrsh7th/cmp-path'},
--            {'saadparwaiz1/cmp_luasnip'},
--            {'hrsh7th/cmp-nvim-lsp'},
--            {'hrsh7th/cmp-nvim-lua'},
--
--            -- Snippets
--            {'L3MON4D3/LuaSnip'},
--            -- Snippet Collection (Optional)
--            {'rafamadriz/friendly-snippets'},
--        }
--    }
--}
