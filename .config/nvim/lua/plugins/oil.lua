-- Plugin file explorer to edit directories and files like a file buffer
return {
    'stevearc/oil.nvim',
    opts = {
        default_file_explorer = true,
        columns = {
            "icon",
        },
        use_default_keymaps = true,

        view_options = {
            show_hidden = true,

            -- This function defines what is considered a "hidden" file
            is_hidden_file = function(name, bufnr)
                local m = name:match("^%.")
                return m ~= nil
            end,

            -- This function defines what will never be shown, even when `show_hidden` is set
            is_always_hidden = function(name, bufnr)
                return false
            end,

            -- Sort file names in a more intuitive order
            natural_order = 'fast',

            -- Sort file and directory names case insensitive
            case_insensitive = false,
            sort = {
                -- sort order can be "asc" or "desc"
                { 'type', 'asc' },
                { 'name', 'asc' },
            },
        },

        -- Configuration for the floating window
        float = {
            max_width = 0.6,
            max_height = 0.4,

            -- override the oil buffers window title
            get_win_title = nil,

            -- preview_split: "auto", "left", "right"
            preview_split = 'left',

            override = function(conf)
                return conf
            end
        },
    },

    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
