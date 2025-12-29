return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- Enable only the picker
    picker = {
      enabled = true,
      -- Optional: choose a default layout (e.g., "telescope", "vertical", "ivy")
      -- layout = "telescope", 
    },
	image = {
		enabled = true,
	},
	animate = {
		enabled = true,
	},
    -- You can leave other modules disabled or omit them entirely
    -- as they are disabled by default.
  },
}
