return {
	{ "nvimtools/none-ls-extras.nvim" },
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
                    --https://github.com/ThePrimeagen/refactoring.nvim
                    null_ls.builtins.code_actions.refactoring,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.completion.spell,
					--php
					null_ls.builtins.diagnostics.phpcs,
					null_ls.builtins.diagnostics.phpstan,
                    null_ls.builtins.formatting.phpcbf,
					--js
					null_ls.builtins.formatting.prettierd,
				},
			})

			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[A]ction" })
			vim.keymap.set({ "n", "v" }, "<leader>cf", vim.lsp.buf.format, { desc = "[F]ormat" })
		end,
	},
}
