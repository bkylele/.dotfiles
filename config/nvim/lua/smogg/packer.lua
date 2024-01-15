vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

---------------------- ENVIRONMENT PLUGINS ------------------------------

use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
}

use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' }, -- Required
        {                            -- Optional
            'williamboman/mason.nvim',
            run = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },     -- Required
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'L3MON4D3/LuaSnip' },     -- Required

        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'rafamadriz/friendly-snippets' },
    }
}

----------------------- MAJOR MODES ------------------------------------

use('lervag/vimtex')

use {
    'vimwiki/vimwiki',
    requires = {
        { 'mattn/calendar-vim' },
        -- { 'michaelb/sniprun', run = 'sh install.sh' },
    }
}

----------------------- PRODUCTIVITY TOOLS --------------------------

use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    requires = { { 'nvim-lua/plenary.nvim' } }
}
use('jbyuki/venn.nvim')
use('mbbill/undotree')
use('tpope/vim-commentary')
use('tpope/vim-surround')
use('tpope/vim-fugitive')
use('Exafunction/codeium.nvim')

---------------------- APPEARANCE ------------------------------------

use {
    'catppuccin/nvim',
    as = 'catppuccin'
}
use('famiu/feline.nvim')
use('lewis6991/gitsigns.nvim')

use('onsails/lspkind.nvim')

use('andweeb/presence.nvim')

----------------------- MISC ----------------------------------------

use('seandewar/nvimesweeper')
use('ThePrimeagen/vim-be-good')
use('eandrju/cellular-automaton.nvim')
-- use('seandewar/killersheep.nvim')

-- So far this is the prettiest leetcode plugin, but it's still pretty buggy
use {
    "kawre/leetcode.nvim",
    requires = {
        "MunifTanjim/nui.nvim",
        -- optional
        "rcarriga/nvim-notify",
        "kyazdani42/nvim-tree.lua", -- Use "kyazdani42/nvim-tree.lua" instead of "nvim-tree/nvim-web-devicons"
    },
}

end)
