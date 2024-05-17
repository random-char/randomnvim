return {
    { "none-ls-extras.nvim" },
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.completion.spell,
                    --php
                    null_ls.builtins.diagnostics.phpcs,
                    null_ls.builtins.diagnostics.phpstan,
                    null_ls.builtins.formatting.phpcsfixer,
                },
            })

            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
        end,
    },
}
