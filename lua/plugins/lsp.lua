return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                opts = {
                    auto_install = true,
                    ensure_installed = {
                        "gopls",
                    },
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.gopls.setup({
                capabilities = capabilities,
            })

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })

            lspconfig.phpactor.setup({
                capabilities = capabilities,
            })

            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[A]ction" })
            vim.keymap.set({ "n", "v" }, "<leader>cd", vim.lsp.buf.declaration, { desc = "[D]eclaration" })
            vim.keymap.set({ "n", "v" }, "<leader>cD", vim.lsp.buf.definition, { desc = "[D]efinitions" })
            vim.keymap.set({ "n", "v" }, "<leader>cr", vim.lsp.buf.rename, { desc = "[R]ename" })
        end,
    },
}
