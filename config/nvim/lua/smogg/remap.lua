vim.g.mapleader = " "

vim.cmd("cnoreabbrev W w")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

vim.keymap.set("n", "<C-W>v", "<C-W>v20<C-W>>")
vim.keymap.set("n", "<C-W>s", "<C-W>s10<C-W>+")

-- terminal
vim.keymap.set("n", "<leader>9", ":tabnew<CR>:term<CR>")
vim.keymap.set("n", "<leader>0", ":tabo<CR>")

-- move around visual selections
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- delete into void register before pasting
vim.keymap.set("v", "<leader>p", "\"_dP")

-- copy to system clipboard
vim.keymap.set("v", "<leader>y", "\"+y")

-- define line highlight color
vim.cmd('highlight LineHighlight ctermbg=darkgray guibg=darkblue')
-- highlight the current line
vim.keymap.set("n", "<leader>l", ":call matchadd('LineHighlight', '\\%'.line('.').'l')<CR>")
-- clear all the highlighted lines
vim.keymap.set("n", "<leader>c", ":call clearmatches()<CR>")
