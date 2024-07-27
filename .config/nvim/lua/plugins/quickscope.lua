-- https://github.com/unblevable/quick-scope

return {
  "unblevable/quick-scope",
  event = "VeryLazy",

  config = function()
    vim.g.qs_filetype_blacklist = {
      "fugitive",
      "help",
      "lazy",
      "lspinfo",
      "mason",
      "NvimTree",
      "packer",
      "TelescopePrompt",
    }
  end,
}
