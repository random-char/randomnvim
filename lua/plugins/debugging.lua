return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()

			dap.adapters.delve = function(callback, config)
				if config.mode == "remote" and config.request == "attach" then
					callback({
						type = "server",
						host = config.host or "127.0.0.1",
						port = config.port or "38697",
					})
				else
					callback({
						type = "server",
						port = "${port}",
						executable = {
							command = "dlv",
							args = { "dap", "-l", "127.0.0.1:${port}", "--log", "--log-output=dap" },
							detached = vim.fn.has("win32") == 0,
						},
					})
				end
			end

			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = "/home/user/Software/codelldb/adapter/codelldb",
					args = { "--port", "${port}" },
				},
			}

			dap.configurations.odin = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd(), "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}

			vim.keymap.set("n", "<leader>dc", function()
				dap.continue()
			end, { desc = "[C]ontinue" })
			vim.keymap.set("n", "<leader>do", function()
				dap.step_over()
			end, { desc = "[O]ver" })
			vim.keymap.set("n", "<leader>di", function()
				dap.step_into()
			end, { desc = "[I]nto" })
			vim.keymap.set("n", "<F12>", function()
				dap.step_out()
			end)
			vim.keymap.set("n", "<leader>db", function()
				dap.toggle_breakpoint()
			end, { desc = "Toggle [B]reakpoint" })
			-- vim.keymap.set("n", "<leader>dr", function()
			-- 	dap.repl.open()
			-- end)
			-- vim.keymap.set("n", "<leader>dl", function()
			-- 	dap.run_last()
			-- end)

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
}
