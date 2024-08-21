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
                    --js
                    null_ls.builtins.formatting.prettierd,
				},
			})

			vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "[F]ormat" })
		end,
	},
}
