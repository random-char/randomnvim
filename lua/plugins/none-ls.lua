return {
	{ "nvimtools/none-ls-extras.nvim" },
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

			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[A]ction" })
			vim.keymap.set({ "n", "v" }, "<leader>cf", vim.lsp.buf.format, { desc = "[F]ormat" })
		end,
	},
}
