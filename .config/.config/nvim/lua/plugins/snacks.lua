-- Plugin for small QoL enhancements
return {
    "folke/snacks.nvim",

    priority = 1000,

    lazy = false,

    ---@type snacks.Config

    opts = {

        -- your configuration comes here
        -- or leave it empty to use the default settings

        -- auto prevents things like LSP + treesitter from attaching to a big file buffer to prevent crashing
        bigfile = { enabled = true },

        dashboard = { enabled = true },

        -- better vim input box
        input = { enabled = true },

        -- notification boxes
        notifier = { enabled = true },

        -- render file as quickly as possible before loading plugins
        quickfile = { enabled = true },

        -- smooth scrolling
        scroll = { enabled = true },

        -- auto show LSP references
        words = { enabled = true },

    },

}
