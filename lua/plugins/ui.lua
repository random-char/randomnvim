--todo add highlight
return {
	--theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	--status line
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
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				cmdline = {
					view = "cmdline",
				},
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},
				presets = {
					bottom_search = true,
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			})
		end,
	},
	--key suggestion and explanation
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
						-- a = "[A]ction"
						-- d = "[D]efinitions",
						-- i = "[I]mplementations",
						-- f = "[F]ormat",
                        -- r = "[R]eferences",
					},
					d = {
						name = "[D]ebug",
                        -- b = "Toggle [B]reakpoint",
						-- c = "[C]ontinue",
						-- o = "[O]ver",
						-- i = "[I]nto",
					},
					f = {
						name = "[F]ind",
						-- f = "[F]iles",
						-- g = "Live [G]rep",
					},
					g = {
						name = "[G]it",
						-- b = "[B]lame line",
						-- h = "Preview [H]unk",
						-- l = "[L]azyGit",
					},
					l = {
						name = "[L]SP",
						-- r = "[R]ename"
						-- h = "[H]over",
					},
					n = {
						name = "[N]avigate",
						n = {"<cmd>bnext<cr>", "[N]ext"},
						p = {"<cmd>bprev<cr>", "[P]rev"},
					},
				}, { prefix = "<leader>" })
			end,
		},
	},
}
