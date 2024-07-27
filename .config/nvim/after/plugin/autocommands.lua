local util = require("util")

-- Create augroups
vim.api.nvim_create_augroup("active_window", { clear = true })
vim.api.nvim_create_augroup("autoreload", { clear = true })
vim.api.nvim_create_augroup("cleanup", { clear = true })
vim.api.nvim_create_augroup("folds", { clear = true })
vim.api.nvim_create_augroup("neotest", { clear = true })
vim.api.nvim_create_augroup("nvim_config", { clear = true })
vim.api.nvim_create_augroup("telescope", { clear = true })
vim.api.nvim_create_augroup("terminal", { clear = true })
vim.api.nvim_create_augroup("winbar", { clear = true })
vim.api.nvim_create_augroup("yank_highlight", { clear = true })

-- Autoreload current buffer when switching to it
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
    group = "autoreload",
    pattern = { "*" },
    command = "silent! checktime",
})

-- Auto-save/load folds
vim.api.nvim_create_autocmd("BufWinLeave", {
    group = "folds",
    pattern = { "*.*" },
    command = "mkview!",
})

vim.api.nvim_create_autocmd("BufWinEnter", {
    group = "folds",
    pattern = { "*.*" },
    command = "silent! loadview",
})

-- Flash the yanked text when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    group = "yank_highlight",
    pattern = { "*" },
    command = "silent! lua vim.highlight.on_yank()",
})

-- Reload nvim config when it changes
vim.api.nvim_create_autocmd("BufWritePost", {
    group = "nvim_config",
    pattern = { "$MYVIMRC" },
    command = "source $MYVIMRC",
})

-- Map Ctrl-c even when not in insertmode
vim.api.nvim_create_autocmd("TermOpen", {
    group = "terminal",
    pattern = { "*" },
    command = "nnoremap <buffer> <C-c> i<C-c>",
})

vim.api.nvim_create_autocmd("BufEnter", {
    desc = "Clear editor clutter for telescope windows",
    group = "telescope",
    pattern = { "*" },
    callback = function()
        vim.schedule(function() -- Have to schedule, as Telescope doesn't set filetype upon open
            if vim.bo.filetype == "TelescopePrompt" then
                vim.opt_local.cursorline = false
                vim.opt_local.cursorcolumn = false
                vim.opt_local.number = false
                vim.opt_local.relativenumber = false
            end
        end)
    end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "WinLeave" }, {
    desc = "Turn off certain UI elements when buffer is inactive",
    group = "active_window",
    pattern = { "*" },
    callback = function()
        local filetype_exclude = {
            "help",
            "lazy",
            "lspinfo",
            "mason",
            "NvimTree",
            "packer",
            "TelescopePrompt",
        }

        local buftype_exclude = {
            "terminal",
        }

        if vim.tbl_contains(filetype_exclude, vim.bo.filetype) or vim.tbl_contains(buftype_exclude, vim.bo.buftype) then
            return
        end

        vim.opt_local.cursorline = false
        vim.opt_local.cursorcolumn = false
        vim.opt_local.relativenumber = false
        vim.opt.statuscolumn = [[%!v:lua.inactive_statuscolumn()]]
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "WinEnter" }, {
    desc = "Turn on relativenumber when buffer is active",
    group = "active_window",
    pattern = { "*" },
    callback = function()
        local filetype_exclude = {
            "help",
            "lazy",
            "lspinfo",
            "mason",
            "NvimTree",
            "packer",
            "TelescopePrompt",
        }

        local buftype_exclude = {
            "terminal",
        }

        if vim.tbl_contains(filetype_exclude, vim.bo.filetype) or vim.tbl_contains(buftype_exclude, vim.bo.buftype) then
            return
        end

        vim.opt_local.cursorline = true
        vim.opt_local.cursorcolumn = true
        vim.opt_local.relativenumber = true
        vim.opt.statuscolumn = [[%!v:lua.statuscolumn()]]
    end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    group = "active_window",
    pattern = { "TelescopePrompt" },
    command = [[set nonumber norelativenumber statuscolumn=]],
})

vim.api.nvim_create_autocmd({ "BufLeave" }, {
    desc = "Close an unedited buffer if it's unnamed",
    group = "cleanup",
    pattern = { "*" },
    callback = function()
        if vim.bo.filetype == "" and vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
            vim.bo.buftype = "nofile"
            vim.bo.bufhidden = "unload"
        end
    end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter", "BufFilePost", "BufWritePost", "CursorHold", "CursorHoldI" }, {
    desc = "Set winbar to filename, when possible",
    group = "winbar",
    pattern = { "*" },
    callback = function()
        local filetype_exclude = {
            "dashboard",
            "fugitive",
            "gitcommit",
            "help",
            "lspinfo",
            "NvimTree",
            "packer",
            "qf",
        }

        local filename = util.filename()
        if vim.fn.winheight(0) <= 1 or filename == "[No Name]" or vim.tbl_contains(filetype_exclude, vim.bo.filetype) then
            return
        end

        vim.opt_local.winbar = filename
    end,
})

for _, ft in ipairs({ "output", "attach", "summary" }) do
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "neotest-" .. ft,
        group = "neotest",
        callback = function(opts)
            vim.keymap.set("n", "q", function()
                pcall(vim.api.nvim_win_close, 0, true)
            end, {
                buffer = opts.buf,
            })
        end,
    })
end



function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})


--autocmd('TextYankPost', {
    --group = yank_group,
    --pattern = '*',
    --callback = function()
        --vim.highlight.on_yank({
            --higroup = 'IncSearch',
            --timeout = 40,
        --})
    --end,
--})

--autocmd({ "BufWritePre" }, {
    --group = JohnGroup,
    --pattern = "*",
    --command = [[%s/\s\+$//e]],
--})

--autocmd('LspAttach', {
    --group = JohnGroup,
    --callback = function(e)
        --local opts = { buffer = e.buf }
        --vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        --vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        --vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        --vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        --vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        --vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        --vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        --vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        --vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        --vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    --end
--})
