-----------------------------------------------------------
---                        Options                      ---
-----------------------------------------------------------

-- Block style cursor
vim.o.guicursor = ''

-- Show line numbers
vim.o.number  = true
vim.o.relativenumber = true

-- Cursor cannot be less than 8 lines from edges
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- Tabs
vim.o.tabstop = 4       -- tab length
vim.o.softtabstop = 4   -- move to the next 'tabstop', instead of adding a full tab
vim.o.shiftwidth = 4    -- autoindent length, w/ '<<' or '>>'
vim.o.expandtab = true  -- expand all tabs to n spaces

-- Search
vim.o.incsearch = true  -- show search as it is being typed
vim.o.hlsearch = false  -- don't keep search word highlight
vim.o.ignorecase = true -- case insensitive search
vim.o.smartcase = true  -- unless capital letters are used

-- Persistent undo history
vim.o.undofile = true
vim.o.swapfile = false
vim.o.backup = false

-- Netrw
vim.g.netrw_dirhistmax = 0  -- suppress netrw history
vim.g.netrw_banner = 0      -- no banner
vim.g.netrw_liststyle = 3   -- tree style

-- General Appearance
vim.o.termguicolors = true
vim.o.conceallevel = 2
vim.o.winborder = 'rounded'
vim.o.list = true
-- vim.o.listchars = 'tab:> ,trail:-,nbsp:+,eol:^'

-- Misc
vim.cmd('filetype plugin on')
vim.cmd('syntax on')
vim.cmd('set completeopt+=noselect') -- omnicomplete won't autoselect first option

-- grr
vim.g.filetype_pl = 'prolog'


-----------------------------------------------------------
---                         Maps                        ---
-----------------------------------------------------------

vim.keymap.set('n', '<c-c>', '<esc>')
vim.keymap.set('t', '<c-[>', '<c-\\><c-n>')

vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>pv', '<cmd>Explore<cr>',   { desc = 'Open netrw'})
vim.keymap.set('n', '<leader>pV', '<cmd>Vexplore<cr>',  { desc = 'Open netrw in a vertical split'})
vim.keymap.set('n', '<leader>pf', ':find<space>**/*',   { desc = 'Find file in path'})
vim.keymap.set('n', '<leader>ps', ':grep<space>',       { desc = 'Grep file(s)'})

vim.keymap.set('n', '<c-d>', '<c-d>zz')
vim.keymap.set('n', '<c-u>', '<c-u>zz')

vim.keymap.set('n', 'gyy', 'yygcc', { remap = true },   { desc = 'Yank line then comment'})
vim.keymap.set('v', 'gy', 'ygvgc',  { remap = true },   { desc = 'Yank selection then comment'})

vim.keymap.set('v', '<leader>y', '"+y',                 { desc = 'Yank to system clipboard'})


-----------------------------------------------------------
---                        Plugins                      ---
-----------------------------------------------------------

vim.pack.add({
 -- Movement/Actions
 'https://github.com/echasnovski/mini.surround',

 -- Project/Workflow
 'https://github.com/stevearc/oil.nvim',
 'https://github.com/mbbill/undotree',
 'https://github.com/tpope/vim-dispatch',
 'https://github.com/neovim/nvim-lspconfig',
 'https://github.com/chomosuke/typst-preview.nvim',

 -- Misc
 'https://github.com/catppuccin/nvim',
 'https://github.com/sphamba/smear-cursor.nvim',
})

-- Oil
require('oil').setup({
      columns = { 'icon', 'permissions', 'size', 'mtime', },
      skip_confirm_for_simple_edits = true,
      watch_for_changes = true,
      view_options = { show_hidden = true, },
})
vim.keymap.set('n', '<leader>pv', '<cmd>Oil<cr>',       { desc = 'Open Oil'})
vim.keymap.set('n', '<leader>pV', '<cmd>vert Oil<cr>',  { desc = 'Open Oil in vertical split'})

-- Surround
require('mini.surround').setup()

-- Undotree
vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<cr>', { desc = 'Toggle the Undotree Window' })

-- Typst
require('typst-preview').setup()

-- LSP
vim.lsp.enable({
    -- modify as needed, see (:h lspconfig-all) for list of available servers configurations
    'clangd',
    'cmake',
    'rust_analyzer',
})
vim.keymap.set('n', '<c-k>', vim.diagnostic.open_float,     { desc = 'Show diagnostics under the cursor' })

-- Appearance
vim.cmd.colorscheme('catppuccin')
require('smear_cursor').setup()
