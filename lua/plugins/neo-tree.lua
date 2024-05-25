return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local neo_tree = require("neo-tree")
		neo_tree.setup({
			window = {
				position = "left",
				width = 40,
				mapping_options = {
					noremap = true,
					nowait = true,
				},
				mappings = {
					["<space>"] = {
						"toggle_node",
						nowait = false,
					},
					["<cr>"] = "open",
					["l"] = "open",
					["C"] = "close_node",
					["h"] = "close_node",
				},
			},
		})
		vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>", { desc = "NeoTree [E]xplorer" })
	end,
}
