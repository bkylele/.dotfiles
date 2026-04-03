return {
    'stevearc/oil.nvim',

    opts = {
        columns = {
            'icon',
            'permissions',
            'size',
            'mtime',
        },

        skip_confirm_for_simple_edits = true,
        watch_for_changes = true,
        view_options = { show_hidden = true, },
    },

    keys = {
        { "<leader>pv", "<cmd>Oil<cr>", desc = "Open Oil" },
    },

    dependencies = { { "nvim-mini/mini.icons", opts = {} } },

    -- Lazy loading is not recommended because it is very tricky to make it
    -- work correctly in all situations.
    lazy = false,
}
