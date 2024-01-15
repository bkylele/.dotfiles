vim.g.clipboard = {
    name = 'xclip-xfce4-clipman',
    copy = {
        ['+'] = 'xclip -selection clipboard',
        ['*'] = 'xclip -selection clipboard',
    },
    paste = {
        ['+'] = 'xclip -selection clipboard -o',
        ['*'] = 'xclip -selection clipboard -o',
    },
    cache_enabled = 1,
}

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartcase = true

vim.opt.scrolloff = 8

