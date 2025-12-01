-----------------------------------------------------------
---                        Options                      ---
-----------------------------------------------------------

vim.o.guicursor = ''

vim.o.number  = true
vim.o.relativenumber = true

vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.undofile = true
vim.o.swapfile = false
vim.o.backup = false

vim.g.netrw_dirhistmax = 0
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

vim.o.termguicolors = true
vim.o.conceallevel = 2
vim.o.winborder = 'rounded'
vim.o.list = true
-- vim.o.listchars = 'tab:> ,trail:-,nbsp:+,eol:^'

vim.cmd('filetype plugin on')
vim.cmd('syntax on')
vim.cmd('set completeopt+=noselect')

-- grr
vim.g.filetype_pl = 'prolog'


-----------------------------------------------------------
---                         Maps                        ---
-----------------------------------------------------------

vim.keymap.set('n', '<c-c>', '<esc>')
vim.keymap.set('t', '<c-[>', '<c-\\><c-n>')

vim.g.mapleader = ' '
vim.g.maplocalleader = "\\"

vim.keymap.set('n', '<leader>pv', '<cmd>Explore<cr>',   { desc = 'Open netrw'})
vim.keymap.set('n', '<leader>pV', '<cmd>Vexplore<cr>',  { desc = 'Open netrw in a vertical split'})
vim.keymap.set('n', '<leader>pf', ':find<space>**/*',   { desc = 'Find file in path'})
vim.keymap.set('n', '<leader>ps', ':grep<space>',       { desc = 'Grep file(s)'})

vim.keymap.set('i', '<C-a>', '<C-o>^',                  { desc = 'Emacs-style move to start of line'})
vim.keymap.set('i', '<C-e>', '<C-o>$',                  { desc = 'Emacs-style move to start of line'})

vim.keymap.set('n', '<c-d>', '<c-d>zz')
vim.keymap.set('n', '<c-u>', '<c-u>zz')

vim.keymap.set('n', 'gyy', 'yygcc', { remap = true },   { desc = 'Yank line then comment'})
vim.keymap.set('v', 'gy', 'ygvgc',  { remap = true },   { desc = 'Yank selection then comment'})

vim.keymap.set('v', '<leader>y', '"+y',                 { desc = 'Yank to system clipboard'})


-----------------------------------------------------------
---                        Plugins                      ---
-----------------------------------------------------------

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = { { import = "plugins" }, },
  checker = { enabled = true },
})
