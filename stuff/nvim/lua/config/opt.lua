vim.o.guicursor = ''
vim.o.mouse = ''

vim.o.number = true
vim.o.relativenumber = true

vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
-- :noh after 4 secs or on entering insert
vim.cmd.packadd('nohlsearch')
vim.cmd('let loaded_matchparen = 1')

vim.o.undofile = true
vim.o.swapfile = false
vim.o.backup = false

vim.o.clipboard = 'unnamedplus'
vim.cmd('filetype plugin on')
vim.cmd('syntax on')
vim.cmd('set completeopt+=fuzzy')

vim.g.filetype_pl = 'prolog'

vim.o.termguicolors = true
vim.o.conceallevel = 2
vim.o.winborder = 'double'

