vim.pack.add({
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/nvim-mini/mini.icons',
})

require('oil').setup({
    columns = {
        'icon',
        'permissions',
        'size',
        'mtime',
    },

    skip_confirm_for_simple_edits = true,
    watch_for_changes = true,
    view_options = { show_hidden = true, },
})

vim.keymap.set('n', '<leader>pv', '<cmd>Oil<cr>', { desc = 'Open Oil' })
