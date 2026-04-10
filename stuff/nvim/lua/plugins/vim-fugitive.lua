vim.pack.add({
    'https://github.com/tpope/vim-fugitive'
})

vim.keymap.set('n', '<leader>g', '<cmd>Git<cr>', { desc = 'Open Git status window' })
