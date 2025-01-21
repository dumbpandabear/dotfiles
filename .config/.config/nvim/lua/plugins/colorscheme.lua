-- Manage theme/colorscheme
-- Install + Change colorscheme
return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- add tokyonight
  {
   "folke/tokyonight.nvim",
   lazy = true,
   opts = { style = "moon" },
  },

  -- add catppuccin
  {
	  "catppuccin/nvim",
	  lazy = true,
	  name = "catppuccin",
  },

  -- Configure LazyVim to load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
