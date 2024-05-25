--todo add highlight
return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = { theme = "dracula" },
			})
		end,
	},
	{
		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			init = function()
				vim.o.timeout = true
				vim.o.timeoutlen = 300
			end,
			opts = {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			},
			config = function()
				local wk = require("which-key")
				wk.register({
					c = {
						name = "[C]ode",
						-- f = "[F]ormat",
					},
					d = {
						name = "[D]ebug",
						-- c = "[C]ontinue",
						-- o = "[O]ver",
						-- i = "[I]nto",
					},
					f = {
						name = "[F]ind",
					},
					g = {
						name = "[G]it",
						-- b = "Show [B]lame",
						-- h = "Preview [H]unk",
						-- l = "[L]azyGit",
					},
				}, { prefix = "<leader>" })
			end,
		},
	},
}
