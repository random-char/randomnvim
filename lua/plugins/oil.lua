return {
	{
		"stevearc/oil.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local oil = require("oil")
			oil.setup({
				default_file_explorer = true,
				columns = {
					"icon",
					-- "permissions",
					-- "size",
					-- "mtime",
				},
			})

			vim.keymap.set("n", "<leader>o", oil.open, { desc = "[O]il" })
		end,
	},
}
