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
			--lspconfig.php.setup({
			--	capabilities = capabilities,
			--})

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
            })

			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
