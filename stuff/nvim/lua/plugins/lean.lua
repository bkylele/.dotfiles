vim.pack.add({
    'https://github.com/Julian/lean.nvim',
})

vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
  pattern = { '*.lean' },
  group = grp,
  callback = function()
    require('lean').setup({
        mappings = true,
    })
  end,
})

-- return {
--   'Julian/lean.nvim',
--   event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },
--
--   dependencies = {
--     -- optional dependencies:
--
--     -- 'nvim-telescope/telescope.nvim', -- for 2 Lean-specific pickers
--     -- 'andymass/vim-matchup',          -- for enhanced % motion behavior
--     -- 'andrewradev/switch.vim',        -- for switch support
--     -- 'tomtom/tcomment_vim',           -- for commenting
--   },
--
--   ---@type lean.Config
--   opts = { -- see https://github.com/Julian/lean.nvim for full configuration options
--     mappings = true,
--   }
-- }
