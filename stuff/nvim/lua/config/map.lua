vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.keymap.set('n', '<c-c>', '<esc>')
vim.keymap.set('t', '<c-[>', '<c-\\><c-n>')

-- emacs style movement in insert mode
vim.keymap.set('i', '<c-a>', '<C-o>^')
vim.keymap.set('i', '<c-e>', '<C-o>$')
vim.keymap.set('i', '<c-f>', '<right>')
vim.keymap.set('i', '<c-b>', '<left>')
vim.keymap.set('i', '<m-f>', '<C-o>W')
vim.keymap.set('i', '<m-b>', '<C-o>B')
vim.keymap.set('i', '<c-d>', '<C-o>dl')
vim.keymap.set('i', '<m-d>', '<C-o>dW')

vim.keymap.set('c', '<c-a>', '<home>')
vim.keymap.set('c', '<c-e>', '<end>')
-- vim.keymap.set('c', '<c-f>', '<right>')
vim.keymap.set('c', '<c-b>', '<left>')
vim.keymap.set('c', '<m-f>', '<c-right>')
vim.keymap.set('c', '<m-b>', '<c-left>')
vim.keymap.set('c', '<c-d>', '<delete>')
vim.keymap.set('c', '<m-d>', '<c-right><c-w><delete>')

vim.keymap.set('n', '<c-d>', '<c-d>zz')
vim.keymap.set('n', '<c-u>', '<c-u>zz')

vim.keymap.set('n', 'gyy', 'yygcc', { remap = true })
vim.keymap.set('v', 'gy', 'ygvgc', { remap = true })

vim.keymap.set('n', '<leader>pf', ':find<leader>',       { desc = 'Find file' })
vim.keymap.set('n', '<leader>ps', ':grep<leader>',       { desc = 'Grep' })
vim.keymap.set('n', '<leader>pv', '<cmd>Explore<cr>',    { desc = 'Open Netrw' })
vim.keymap.set('n', '<leader>u', '<cmd>Undotree<cr>',    { desc = 'Open Undotree' })
vim.keymap.set('n', '<leader>pc', '<cmd>e $MYVIMRC<cr>', { desc = 'Open vimrc' })
