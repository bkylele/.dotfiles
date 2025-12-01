return {
    { 'tpope/vim-surround', },
    { 'tpope/vim-dispatch', },

    {
        'mbbill/undotree',
        keys = {
            { '<leader>u', '<cmd>UndotreeToggle<cr>', desc = 'Toggle Undotree' },
        },
    },

    {
        'stevearc/oil.nvim',
        keys = {
            { '<leader>pv', '<cmd>Oil<cr>', desc = 'Open Oil' },
            { '<leader>pV', '<c-w>s<c-w>K<cmd>Oil<cr>', desc = 'Open Oil split' },
        },
        opts = {
            columns = { 'icon', 'permissions', 'size', 'mtime', },
            skip_confirm_for_simple_edits = true,
            watch_for_changes = true,
            view_options = { show_hidden = true, },
        },
        lazy = false,
    },

    { 'neovim/nvim-lspconfig', },

    {
        'catppuccin/nvim',
        config = function()
            require('catppuccin').setup({
                flavour = 'mocha'
            })
            vim.cmd.colorscheme('catppuccin')
        end,
    },

    {
        'sphamba/smear-cursor.nvim',
        opts = {},
    },

    {
        'junegunn/goyo.vim',
        config = function()
            vim.g.goyo_linenr = 1
        end,
    },
}
