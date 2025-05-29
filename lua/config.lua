vim.cmd("set expandtab")
vim.cmd("set shiftwidth=4")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

-- per-project config
vim.opt.exrc = true

vim.g.mapleader = " "

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", {}),
    desc = "Hightlight selection on yank",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
    end,
})
