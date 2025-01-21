return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",           -- LSP installer
        "williamboman/mason-lspconfig.nvim", -- Integration between mason and lspconfig
        "hrsh7th/cmp-nvim-lsp",              -- LSP completions for nvim-cmp
        "hrsh7th/nvim-cmp",                  -- Completion engine
        "L3MON4D3/LuaSnip",                  -- Snippet engine
        "stevearc/conform.nvim",             -- Auto formatting
    },

    config = function()
        -- Setup Mason (LSP Installer)
        require("mason").setup()

        -- Ensure specific LSPs are pre-installed and configured
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "rust_analyzer" },
            handlers = {
                function(server_name)                                                  -- Default handler for all LSPs
                    require("lspconfig")[server_name].setup {
                        capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Completion support
                    }
                end,
            }
        })

        -- Setup completion engine
        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- Snippet expansion
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),

            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
            }, {
                { name = "buffer" },
            })
        })

        -- Configure diagnostics display
        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
            },
        })

        -- Setup Auto Formatting (conform)
        require("conform").setup({

            formatters_by_ft = {
                -- lua = { "stylua" },
                -- python = { "isort", "black" },
                -- rust = { "rustfmt" },
                -- javascript = { "prettierd", "prettier" }
            },

            -- Auto format on file save
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_format = "fallback",
            },

        })
    end
}
