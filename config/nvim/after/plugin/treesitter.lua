require"nvim-treesitter.configs".setup{
    ensure_installed = { "c", "python", "vim", "lua", "bash" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,

        disable = { "tex" },
    },
}

