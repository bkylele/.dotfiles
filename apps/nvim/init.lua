-------------------------------------------------------------------------------
--                                  Options                                  --
-------------------------------------------------------------------------------

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
-- :noh after 4 secs or on entering insert
vim.cmd.packadd("nohlsearch")
vim.cmd("let loaded_matchparen = 1")

vim.o.undofile = true
vim.o.swapfile = false
vim.o.backup = false

vim.o.clipboard = "unnamedplus"
vim.cmd("filetype plugin on")
vim.cmd("syntax on")
vim.cmd("set completeopt+=fuzzy")

vim.g.filetype_pl = "prolog"

vim.o.termguicolors = true
vim.o.conceallevel = 2
vim.o.winborder = "double"

--------------------------------------------------------------------------------
--                                    Maps                                    --
--------------------------------------------------------------------------------

vim.keymap.set("n", "<c-c>", "<esc>")
vim.keymap.set("t", "<c-[>", "<c-\\><c-n>")

-- emacs style movement in insert mode
vim.keymap.set("i", "<c-a>", "<C-o>^")
vim.keymap.set("i", "<c-e>", "<C-o>$")
vim.keymap.set("c", "<c-a>", "<C-f>^i<c-c>")
vim.keymap.set("c", "<c-e>", "<C-f>$a<c-c>")
vim.keymap.set("i", "<c-f>", "<C-o>l")
vim.keymap.set("i", "<c-b>", "<C-o>h")
vim.keymap.set("i", "<m-f>", "<C-o>W")
vim.keymap.set("i", "<m-b>", "<C-o>B")
vim.keymap.set("i", "<c-d>", "<C-o>dl")
vim.keymap.set("i", "<m-d>", "<C-o>dW")

vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "<c-f>", "<c-f>zz")
vim.keymap.set("n", "<c-b>", "<c-b>zz")

vim.keymap.set("n", "gyy", "yygcc", { remap = true })
vim.keymap.set("v", "gy", "ygvgc", { remap = true })

vim.keymap.set("i", "<tab>", "<c-o>==")

vim.keymap.set("n", "<space>pf", ":find<space>**/*")
if vim.fn.executable("fzf") then
    vim.keymap.set("n", "<space>pf", "<cmd>FZF<cr>")
end
vim.keymap.set("n", "<space>ps", ":grep<space>")

vim.keymap.set("n", "<space>gc", "<cmd>e $MYVIMRC<cr>")


-------------------------------------------------------------------------------
--                                Misc/Custom                                --
-------------------------------------------------------------------------------

-- Center code 
local function get_centered_statuscol()
    local win_id = vim.api.nvim_get_current_win()
    local win_width = vim.api.nvim_win_get_width(win_id)

    -- 1. Determine target width (use buffer's textwidth or a default)
    local target_width = vim.bo.textwidth > 0 and vim.bo.textwidth or 80

    -- 2. Calculate the "gutter" width (line numbers + sign column)
    -- 'numberwidth' is the minimum, but we check actual space used
    local gutter_width = vim.fn.getwininfo(win_id)[1].textoff

    -- 3. Calculate padding
    -- We subtract gutter_width because statuscolumn starts at the far left
    local padding = math.floor((win_width - target_width) / 2) - gutter_width

    return padding > 0 and (string.rep(" ", padding) .. "%l ") or ("%l ")
end

vim.api.nvim_create_autocmd({
    "BufEnter", "BufWinEnter", "WinEnter", "WinResized", "VimResized"
}, {
    callback = function()
        if vim.tbl_contains({ "typst", "tex", "markdown" }, vim.bo.filetype) then
            vim.opt_local.statuscolumn = ""
        else
            vim.o.statuscolumn = get_centered_statuscol()
        end
    end,
})

-- Turn on doc stuff for doc types
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "typst", "tex", "markdown" },
    callback = function()
        vim.o.spell = true
        vim.o.wrap = true
        vim.o.linebreak = true -- Breaks lines at words, not mid-word

        vim.keymap.set("n", "j", "gj")
        vim.keymap.set("n", "k", "gk")
    end
})


--------------------------------------------------------------------------------
--                                  Plugins                                   --
--------------------------------------------------------------------------------

local function bootstrap_pckr()
    local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"
    if not (vim.uv or vim.loop).fs_stat(pckr_path) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/lewis6991/pckr.nvim",
            pckr_path
        })
    end
    vim.opt.rtp:prepend(pckr_path)
end
bootstrap_pckr()

require("pckr").add{
    "neovim/nvim-lspconfig";
    {
        "L3MON4D3/LuaSnip",
        run = "make install_jsregexp",
        requires = "honza/vim-snippets",
    };
    "mbbill/undotree";
    "stevearc/oil.nvim";
    "tpope/vim-surround";
    "tpope/vim-fugitive";
    "tpope/vim-dispatch";
}

-- options below are grouped by author name

-- neovim
-- see (:h lspconfig-all) for all configs
vim.lsp.enable({
    "clangd",
    "rust_analyzer",
    "prolog_ls",
})

-- tpope
vim.keymap.set("n", "<space>g", "<cmd>Git<cr>")

-- mbbill
vim.keymap.set("n", "<space>u", "<cmd>UndotreeToggle<cr>")

-- stevearc
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

-- L3MON4D3
local luasnip = require("luasnip")
vim.keymap.set({"i"}, "<tab>", function() luasnip.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<c-l>", function() luasnip.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<c-h>", function() luasnip.jump(-1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<c-e>", function()
    if luasnip.choice_active() then
        luasnip.change_choice(1)
    end
end, {silent = true})
require("luasnip.loaders.from_snipmate").lazy_load()
