vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set('n', '<c-c>', '<esc>')
vim.keymap.set('t', '<c-[>', '<c-\\><c-n>')

-- emacs style movement in insert mode
vim.keymap.set('i', '<c-a>', '<C-o>^')
vim.keymap.set('i', '<c-e>', '<C-o>$')
vim.keymap.set('c', '<c-a>', '<C-f>^i<c-c>')
vim.keymap.set('c', '<c-e>', '<C-f>$a<c-c>')
vim.keymap.set('i', '<c-f>', '<C-o>l')
vim.keymap.set('i', '<c-b>', '<C-o>h')
vim.keymap.set('i', '<m-f>', '<C-o>W')
vim.keymap.set('i', '<m-b>', '<C-o>B')
vim.keymap.set('i', '<c-d>', '<C-o>dl')
vim.keymap.set('i', '<m-d>', '<C-o>dW')

vim.keymap.set('n', '<c-d>', '<c-d>zz')
vim.keymap.set('n', '<c-u>', '<c-u>zz')

vim.keymap.set('n', 'gyy', 'yygcc', { remap = true })
vim.keymap.set('v', 'gy', 'ygvgc', { remap = true })

vim.keymap.set('n', '<space>pf', ':find<space>**/*')
vim.keymap.set('n', '<space>ps', ':grep<space>')
vim.keymap.set('n', '<space>pv', '<cmd>Explore<cr>')
vim.keymap.set('n', '<space>pc', '<cmd>e $MYVIMRC<cr>')
