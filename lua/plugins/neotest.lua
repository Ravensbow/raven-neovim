return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nsidorenco/neotest-vstest",
		{
			"nvim-treesitter/nvim-treesitter", -- Optional, but recommended
			branch = "main",          -- NOTE; not the master branch!
			build = function()
				vim.cmd(":TSUpdate go")
			end,
		},
		{
			"fredrikaverpil/neotest-golang",
			version = "*",                                                  -- Optional, but recommended; track releases
			build = function()
				vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait() -- Optional, but recommended
			end,
		},
		"rouge8/neotest-rust",
	},
	config = function()
		local config = {
			runner = "gotestsum", -- Optional, but recommended
		}
		require("neotest").setup({
			adapters = {
				require("neotest-vstest"),
				require("neotest-golang")(config),
				require("neotest-rust"),
			}
		})
	end,
	keys = {
		{ "<leader>tr",  function() require("neotest").run.run() end,                   desc = "Run nearest test" },
		{ "<leader>tra", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run all file tests" },
		{ "<leader>tp",  function() require("neotest").output_panel.toggle() end,       desc = "Toggle test panel" },
		{ "<leader>ts",  function() require("neotest").summary.toggle() end,            desc = "Toggle summary panel" },
		--TODO: Add debug versions for running
		--TODO: Add jumping between failed tests
	}
}
