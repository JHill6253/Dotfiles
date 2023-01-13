local Remap = require("jtrill.keymap")
local nnoremap = Remap.nnoremap
nnoremap("<leader>pw", function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)
