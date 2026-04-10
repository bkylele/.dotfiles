vim.pack.add({
    'https://github.com/junegunn/goyo.vim',
})

vim.g.goyo_width = 100 -- (default: 80)
-- vim.g.goyo_height = 100 -- (default: 85%)
vim.g.goyo_linenr = 1

-- vim.g.goyo_decoration_elements = {'~', '*', '-'}
-- vim.g.goyo_decoration_density = 0.01 -- (default: 0.00, range 0.00-1.00)

vim.keymap.set('n', '<c-w><c-p>', '<cmd>Goyo<cr>', { desc = 'Toggle Goyo' })
