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
						-- golang
						"gopls",
						-- php
						"phpactor",
						"psalm",
						-- js
						"eslint-lsp",
						"prettierd",
					},
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local telescopt_builtin = require("telescope.builtin")
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

			lspconfig.psalm.setup({
				capabilities = capabilities,
			})

			lspconfig.eslint.setup({
				capabilities = capabilities,
			})

			-- code
			vim.keymap.set({ "n", "v" }, "<leader>cd", vim.lsp.buf.definition, { desc = "[D]efinitions" })
			vim.keymap.set({ "n", "v" }, "<leader>ci", vim.lsp.buf.implementation, { desc = "[I]mplementations" })
			vim.keymap.set(
				{ "n", "v" },
				"<leader>cr",
				telescopt_builtin.lsp_references,
				{ desc = "[R]eferences", noremap = true, silent = true }
			)

			-- lsp
			vim.keymap.set({ "n", "v" }, "<leader>lr", vim.lsp.buf.rename, { desc = "[R]ename" })
			vim.keymap.set({ "n", "v" }, "<leader>lh", vim.lsp.buf.hover, { desc = "[H]over" })
		end,
	},
}
