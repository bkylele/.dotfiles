local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "gA", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "gR", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", '<leader>gg', function() vim.lsp.buf.format({ async = true }) end, opts)
    -- Diagnostics
    vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    -- lsp.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = {
        lsp.default_setup,
        -- (Optional) Configure lua language server for neovim
        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
    },
})


require('codeium').setup({})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    sources = {
        { name = 'codeium' },
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
    },
    mapping = {
        ['<C-k>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    },
    formatting = {
        format = require('lspkind').cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            ellipsis_char = '...',
        })
    }
})


