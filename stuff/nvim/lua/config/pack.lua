-- default plugins
vim.cmd.packadd('nvim.undotree')
vim.cmd.packadd('nvim.difftool')
vim.cmd.packadd('nvim.tohtml')
-- :noh after 4 secs or on entering insert
vim.cmd.packadd('nohlsearch')
vim.cmd('let loaded_matchparen = 1')

require('vim._core.ui2').enable({})

require('plugins.vim-surround')
require('plugins.vim-fugitive')
require('plugins.vim-dispatch')
require('plugins.oil')
require('plugins.kitty-scrollback')
require('plugins.luasnip')
require('plugins.goyo')

-- language specific/misc
require('plugins.lean')

