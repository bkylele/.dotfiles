-----------------------------------------------------------
---							Options						---
-----------------------------------------------------------

local vim = vim -- bandaid for luals

-- Block style cursor
vim.o.guicursor = ''

-- Show line numbers
vim.o.number		 = true
vim.o.relativenumber = true

-- Cursor cannot be less than 8 lines from edges
vim.o.scrolloff		= 8
vim.o.sidescrolloff	= 8

-- Tabs
vim.o.tabstop		= 4		-- tab length
vim.o.softtabstop	= 4		-- move to the next 'tabstop', instead of adding a full tab
vim.o.shiftwidth	= 4		-- autoindent length, w/ '<<' or '>>' 

-- Search
vim.o.incsearch		= true	-- show search as it is being typed
vim.o.hlsearch		= false	-- don't keep search word highlight
vim.o.ignorecase	= true	-- case insensitive search
vim.o.smartcase		= true	-- unless capital letters are used

-- Persistent undo history
vim.o.undofile	= true
vim.o.swapfile	= false
vim.o.backup	= false

-- Netrw
vim.g.netrw_dirhistmax	= 0	-- suppress netrw history
vim.g.netrw_banner		= 0	-- no banner
vim.g.netrw_liststyle	= 3	-- tree style

-- General Appearance
vim.o.termguicolors	= true
vim.o.conceallevel	= 2
vim.o.winborder = 'rounded'

-- Misc
vim.cmd('filetype plugin on')
vim.cmd('syntax on')
vim.cmd('set completeopt+=noselect') -- omnicomplete won't autoselect first option


-----------------------------------------------------------
---							Maps						---
-----------------------------------------------------------

vim.g.mapleader = ' '

-- Navigation
vim.keymap.set('n', '<leader>pv', '<cmd>Explore<cr>')
vim.keymap.set('n', '<leader>pV', '<cmd>Vexplore<cr>')
vim.keymap.set('n', '<leader>pf', ':find<space>*')
vim.keymap.set('n', '<leader>ps', ':grep<space>')

-- Center cursor after page jumping
vim.keymap.set('n', '<c-d>', '<c-d>zz')
vim.keymap.set('n', '<c-u>', '<c-u>zz')

-- Yank before commenting
vim.keymap.set('n', 'gyy', 'yygcc', { remap = true })
vim.keymap.set('v', 'gy', 'ygvgc', { remap = true })

-- Clipboard
vim.keymap.set('v', '<leader>y', '"+y')


-----------------------------------------------------------
---							Plugins						---
-----------------------------------------------------------

vim.pack.add({
	-- Movement/Actions
	{ src = 'https://github.com/echasnovski/mini.surround' },

	-- Project/Workflow
	{ src = 'https://github.com/mbbill/undotree' },
	{ src = 'https://github.com/stevearc/overseer.nvim' },
	{ src = 'https://github.com/neovim/nvim-lspconfig' },

	-- snippets
	-- latex/typst

	-- Misc
	{ src = 'https://github.com/catppuccin/nvim' },
})

require('mini.surround').setup()
require('overseer').setup()

vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<cr>')

vim.lsp.enable({
	'lua_ls',
	'rust-analyzer',
	'clangd',
	'jdtls',
	'pyright',
})

vim.cmd.colorscheme('catppuccin')
