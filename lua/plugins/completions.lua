return {
    { "hrsh7th/cmp-nvim-lsp" },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")

            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    {
                        name = "nvim_lsp",
                        entry_filter = function(entry, ctx)
                            return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
                        end,
                    },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },
}
