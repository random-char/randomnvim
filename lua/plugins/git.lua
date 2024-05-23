return {
	{
		"lewis6991/gitsigns.nvim",
		dependencies = {
			"tpope/vim-fugitive",
		},
		config = function()
			local gitsigns = require("gitsigns")
			gitsigns.setup({
				signcolumn = auto,
				on_attach = function()
					vim.wo.signcolumn = "yes"
				end,
			})

			vim.keymap.set("n", "<leader>gh", gitsigns.preview_hunk, { desc = "Preview [H]unk" })
			vim.keymap.set("n", "<leader>gb", gitsigns.blame_line, { desc = "[B]lame line" })
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>gl", "<cmd>LazyGit<cr>", desc = "[L]azyGit" },
		},
	},
}
