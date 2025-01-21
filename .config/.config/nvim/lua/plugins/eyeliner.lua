-- Plugin highlights unique letters under f/F/t/T
return {
    "jinh0/eyeliner.nvim",
    config = function()
        require("eyeliner").setup({
            -- show highlight only after keypress
            highlight_on_key = true,

            -- dim all other characters if set to true
            dim = true,

            -- max number of characters eyeliner will check for
            max_length = 9999,

            -- filetypes for eyeliner to be disabled
            disabled_filetypes = {},

            -- add eyeliner to f/F/t/T keymaps
            default_keymaps = true,
        })
    end
}
