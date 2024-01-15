require("catppuccin").setup({
    transparent_background = false,
    term_colors = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        treesitter = true,
    },
})

require('gitsigns').setup()

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        package.loaded["feline"] = nil
        package.loaded["catppuccin.groups.integrations.feline"] = nil
        require("feline").setup {
            components = require("catppuccin.groups.integrations.feline").get(),
        }
    end,
})

vim.cmd("colorscheme catppuccin")

vim.opt.conceallevel = 2
