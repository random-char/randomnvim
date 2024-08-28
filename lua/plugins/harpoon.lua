return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			local conf = require("telescope.config").values

			harpoon:setup()

			local function toggle_telescope(harpoon_files)
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end

				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = require("telescope.finders").new_table({
							results = file_paths,
						}),
						previewer = conf.file_previewer({}),
						sorter = conf.generic_sorter({}),
					})
					:find()
			end

			vim.keymap.set("n", "<leader>na", function()
				harpoon:list():add()
			end, { desc = "[A]dd" })

			vim.keymap.set("n", "<leader>nr", function()
				local state = require("telescope.actions.state")
				local selected_entry = state.get_selected_entry()

				harpoon:list():remove(selected_entry)
			end, { desc = "[R]emove" })

			vim.keymap.set("n", "<leader>np", function()
				harpoon:list():prev()
			end, { desc = "[N]ext" })

			vim.keymap.set("n", "<leader>nn", function()
				harpoon:list():next()
			end, { desc = "[P]rev" })

			vim.keymap.set("n", "<leader>nw", function()
				toggle_telescope(harpoon:list())
			end, { desc = "[W]indow" })
		end,
	},
}
