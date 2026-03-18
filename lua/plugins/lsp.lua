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
						-- js
						"eslint-lsp",
						"prettierd",
						-- lua
						"lua_ls",
						-- odin
						"ols",
						-- php
						-- "phpactor",
						"intelephense",
					},
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local telescop_builtin = require("telescope.builtin")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("gopls", {
				capabilities = capabilities,
			})

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})

			vim.lsp.config("intelephense",{
				capabilities = capabilities,
				settings = {
					intelephense = {
						stubs = {
							"bcmath",
							"bz2",
							"Core",
							"curl",
							"date",
							"dom",
							"fileinfo",
							"filter",
							"gd",
							"gettext",
							"hash",
							"iconv",
							"imap",
							"intl",
							"json",
							"libxml",
							"mbstring",
							"mcrypt",
							"mysql",
							"mysqli",
							"password",
							"pcntl",
							"pcre",
							"PDO",
							"pdo_mysql",
							"Phar",
							"readline",
							"regex",
							"session",
							"SimpleXML",
							"sockets",
							"sodium",
							"standard",
							"superglobals",
							"tokenizer",
							"xml",
							"xdebug",
							"xmlreader",
							"xmlwriter",
							"yaml",
							"zip",
							"zlib",
							"wordpress-stubs",
							"woocommerce-stubs",
							"acf-pro-stubs",
							"wordpress-globals",
							"wp-cli-stubs",
							"genesis-stubs",
							"polylang-stubs",
						},
						environment = {
							includePaths = {
								"~/.composer/vendor/php-stubs/",
							},
						},
						files = {
							maxSize = 5000000,
						},
					},
				},
			})

			local phpactor_capabilities = vim.lsp.protocol.make_client_capabilities()
			phpactor_capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}

			phpactor_capabilities["textDocument"]["codeAction"] = {}
			vim.lsp.config("phpactor",{
				capabilities = phpactor_capabilities,
			})

			vim.lsp.config("eslint",{
				capabilities = capabilities,
			})

			vim.lsp.config("ols",{
				capabilities = capabilities,
			})

			-- code
			vim.keymap.set({ "n", "v" }, "<leader>ld", vim.lsp.buf.definition, { desc = "[D]efinitions" })
			vim.keymap.set(
				{ "n", "v" },
				"<leader>li",
				telescop_builtin.lsp_implementations,
				{ desc = "[I]mplementations" }
			)

			vim.keymap.set(
				{ "n", "v" },
				"<leader>lf",
				telescop_builtin.lsp_references,
				{ desc = "Re[f]erences", noremap = true, silent = true }
			)

			-- lsp
			vim.keymap.set({ "n", "v" }, "<leader>lr", vim.lsp.buf.rename, { desc = "[R]ename" })
			vim.keymap.set({ "n", "v" }, "<leader>lh", vim.lsp.buf.hover, { desc = "[H]over" })
		end,
	},
}
