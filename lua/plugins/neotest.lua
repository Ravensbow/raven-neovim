return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
	"nsidorenco/neotest-vstest"
  },
  config = function ()
	  require("neotest").setup({
		  adapters = {
			  require("neotest-vstest")
		  }
	  })
  end,
  keys = {
	  {"<leader>tr", function() require("neotest").run.run() end, desc = "Run nearest test"},
	  {"<leader>tra", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run all file tests"},
	  {"<leader>tp", function() require("neotest").output_panel.toggle() end, desc = "Toggle test panel"},
	  {"<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle summary panel"},
	  --TODO: Add debug versions for running
	  --TODO: Add jumping between failed tests
  }
}
