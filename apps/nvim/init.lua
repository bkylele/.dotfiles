-----------------------------------------------------------
---                        Options                      ---
-----------------------------------------------------------

vim.o.guicursor = ""
vim.o.mouse = ""

vim.o.number = true
vim.o.relativenumber = true

vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.cmd.packadd("nohlsearch")
vim.cmd("let loaded_matchparen = 1")

vim.o.undofile = true
vim.o.swapfile = false
vim.o.backup = false

vim.o.clipboard = "unnamedplus"
vim.cmd("filetype plugin on")
vim.cmd("syntax on")
vim.cmd("set completeopt+=fuzzy")

vim.g.filetype_pl = 'prolog'

vim.o.termguicolors = true
vim.o.conceallevel = 2
vim.o.winborder = "rounded"
vim.cmd("colorscheme slate")

vim.lsp.enable({
    'clangd',
    'rust_analyzer',
    'lua_ls',
})

-----------------------------------------------------------
---                         Maps                        ---
-----------------------------------------------------------

vim.keymap.set("n", "<c-c>", "<esc>")
vim.keymap.set("t", "<c-[>", "<c-\\><c-n>")

-- emacs style movement in insert mode
vim.keymap.set("i", "<c-f>", "<C-o>l")
vim.keymap.set("i", "<c-b>", "<C-o>h")
vim.keymap.set("i", "<m-f>", "<C-o>W")
vim.keymap.set("i", "<m-b>", "<C-o>B")
vim.keymap.set("i", "<c-a>", "<C-o>^")
vim.keymap.set("i", "<c-e>", "<C-o>$")
vim.keymap.set("i", "<c-d>", "<C-o>dl")
vim.keymap.set("i", "<m-d>", "<C-o>dW")

vim.keymap.set("n", "gyy", "yygcc", { remap = true })
vim.keymap.set("v", "gy", "ygvgc", { remap = true })

vim.keymap.set("n", "<C-x><C-f>", ":find<space>**/*")
vim.keymap.set("n", "<C-x><C-s>", ":grep<space>")

vim.keymap.set("n", "<C-k>", vim.diagnostic.open_float)


-----------------------------------------------------------
---                        Plugins                      ---
-----------------------------------------------------------

local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"
  if not (vim.uv or vim.loop).fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end
  vim.opt.rtp:prepend(pckr_path)
end
bootstrap_pckr()

require('pckr').add{
    'tpope/vim-surround';
    'tpope/vim-fugitive';
    'tpope/vim-dispatch';
    'mbbill/undotree';
    'stevearc/oil.nvim';
    'neovim/nvim-lspconfig';
    'honza/vim-snippets';
    'L3MON4D3/LuaSnip';
}

vim.keymap.set("n", "<space>u", "<cmd>UndotreeToggle<cr>")
vim.keymap.set("n", "<space>g", "<cmd>Git<cr>")

require("oil").setup({
    columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
    },
    skip_confirm_for_simple_edits = true,
    watch_for_changes = true,
    view_options = { show_hidden = true, },
})
vim.keymap.set("n", "<space>pv", "<cmd>Oil<cr>")
