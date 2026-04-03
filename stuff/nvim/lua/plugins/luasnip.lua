return {
    'L3MON4D3/LuaSnip',
    -- version = "v2.4.1",
    -- build = "make install_jsregexp"

    dependencies = {
        { 'honza/vim-snippets' }
    },

    config = function()
        local ls = require('luasnip')
        require("luasnip.loaders.from_snipmate").lazy_load()

        vim.keymap.set({"i"}, "<tab>", function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump(1)
            else
                local key = vim.api.nvim_replace_termcodes("<Tab>", true, false, true)
                vim.api.nvim_feedkeys(key, "n", false)
            end
        end, { silent = true, remap = true })

        vim.keymap.set({"i", "s"}, "<s-tab>", function() ls.jump(-1) end, {silent = true})

        vim.keymap.set({"i", "s"}, "<c-e>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, {silent = true})
    end,

    lazy = false,
};

