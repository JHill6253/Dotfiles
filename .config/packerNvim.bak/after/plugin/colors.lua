function ColorMyPencils(color)
        color = color or "gruvbox"
        if color == "gruvbox" then
            vim.g.gruvbox_transparent_sidebar=true
            vim.g.gruvbox_transparent = true
        end
        vim.cmd.colorscheme(color)

        vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
        vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end

ColorMyPencils()
