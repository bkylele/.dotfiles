require("leetcode").setup({
    domain = "com", -- For now "com" is the only one supported
    arg = "leet",
    lang = "cpp",
    sql = "mysql",
    directory = vim.fn.stdpath("data") .. "/leetcode/",
    logging = true,
    console = {
        open_on_runcode = false,
        dir = "row",
        size = {
            width = "90%",
            height = "75%",
        },
        result = {
            size = "60%",
        },

        testcase = {
            virt_text = true,

            size = "40%",
        },
    },
    description = {
        position = "left",

        width = "40%",
    },
})


vim.keymap.set("n", "<leader>LC", ":Leet console<CR>")
vim.keymap.set("n", "<leader>LI", ":Leet info<CR>")
vim.keymap.set("n", "<leader>LD", ":Leet desc<CR>")
vim.keymap.set("n", "<leader>LL", ":Leet lang<CR>")

