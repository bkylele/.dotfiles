if vim.fn.executable 'fd' == 1 then
    -- to be accessible by viml, func needs to be global with '_G'
    function _G.fdFindFiles(arg, _cmdcomplete)
        return vim.fn.systemlist('fd --full-path ' .. arg)
    end
    vim.o.findfunc = 'v:lua.fdFindFiles'
end


vim.api.nvim_create_user_command('Pack', function()
    vim.pack.update(nil, { offline = true })
end, { desc = 'List Plugins' })

vim.api.nvim_create_user_command('PackUpdate', function()
    vim.pack.update()
end, { desc = 'Update Plugins' })

vim.api.nvim_create_user_command('PackDel', function(opts)
    for _,plugin in ipairs(opts.fargs) do
        local ok, err = pcall(function() vim.pack.del({plugin}) end)
        if ok then
            vim.notify(('Removed package: %s'):format(plugin), vim.log.levels.INFO)
        else
            vim.notify(('PackDel failed for %s: %s'):format(plugin, tostring(err)), vim.log.levels.ERROR)
        end
    end
end, { nargs = '+', desc = 'Delete Plugins' })


vim.g.filetype_pl = 'prolog'

vim.api.nvim_create_autocmd("FileType", {
  pattern = "nix",
  callback = function()
    vim.bo.formatprg = ", nixfmt"
  end,
})
