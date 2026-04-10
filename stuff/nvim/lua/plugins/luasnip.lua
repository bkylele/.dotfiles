vim.pack.add({
    'https://github.com/L3MON4D3/LuaSnip',
    'https://github.com/honza/vim-snippets',
})

-- how to run `make install_jsregexp`


local ls = require('luasnip')
require('luasnip.loaders.from_snipmate').lazy_load()

vim.keymap.set({'i'}, '<tab>', function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump(1)
    else
        local key = vim.api.nvim_replace_termcodes('<tab>', true, false, true)
        vim.api.nvim_feedkeys(key, 'n', false)
    end
end, { silent = true, remap = true })

vim.keymap.set({'i', 's'}, '<s-tab>', function() ls.jump(-1) end, {silent = true})

vim.keymap.set({'i', 's'}, '<c-e>', function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, {silent = true})
