-- Manage theme/colorscheme
-- Install + Change colorscheme
return {
  -- add tokyonight
  {
   "folke/tokyonight.nvim",
   opts = { style = "moon" },
  },

  -- add catppuccin
  {
	  "catppuccin/nvim",
	  name = "catppuccin",
	  priority = 1000,
	  init = function()
		   vim.cmd.colorscheme("catppuccin")
		end,
  },
}
