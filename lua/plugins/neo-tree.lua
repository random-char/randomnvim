return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        local neotree = require("neo-tree")
        local neotree_command = require("neo-tree.command")

        local function neotree_focus_or_close()
            local current_buffer_type = vim.api.nvim_get_option_value("filetype", { buf = 0 })
            if current_buffer_type == "neo-tree" then
                neotree_command.execute({ action = "close" })
            else
                neotree_command.execute({ action = "focus", reveal = true, dir = vim.uv.cwd() })
            end
        end

        neotree.setup({
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
                update_focused_file = {
                    enable = true,
                    update_root = false,
                    ignore_list = {},
                },
            },
        })

        vim.keymap.set("n", "<leader>e", neotree_focus_or_close, { desc = "NeoTree [e]xplorer" })
        vim.keymap.set("n", "<leader>E", "<Cmd>Neotree close<CR>", { desc = "Close [E]xplorer" })
    end,
}
