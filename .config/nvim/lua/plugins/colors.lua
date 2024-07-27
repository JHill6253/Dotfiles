
function ColorMe(color)
    local colors = {
        ["tokyo"] = "tokyonight",
        ["everforest"] = "everforest",
        ["rose-pine"] = "rose-pine",
        ["gruvbox"] = "gruvbox",
        ["cat"] = "catppuccin"
    }
	color = colors[color] or "rose-pine"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end
-- how can I remap this to a keybinding?
vim.api.nvim_set_keymap('n', '<leader>cc', ':lua ColorMe("cat")<CR>', { noremap = true, silent = true })
return {
    {
        "folke/tokyonight.nvim",
        name="tokyonight",
        config = function()
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                transparent = true, -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = false },
                    keywords = { italic = false },
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark", -- style for floating windows
                },
            })
        end
    },
    {
        'sainnhe/everforest',
        name = 'everforest',
        config = function()
            vim.cmd("colorscheme everforest")

            ColorMe()
        end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
            })

            vim.cmd("colorscheme rose-pine")

            ColorMe()
        end
    },
    {
        'morhetz/gruvbox',
        name='gruvbox',
        config = function()
            vim.cmd('colorscheme gruvbox')
            vim.cmd("highlight Normal guibg=none ctermbg=None")
            ColorMe()
        end
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 }

}
