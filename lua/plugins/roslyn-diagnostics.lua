return {
	"bosvik/roslyn-diagnostics.nvim",
	ft = { "cs", "fs" },
	opts = {
		-- Optional filter function to filter out files that should not be processed
		-- This is equivalent to the default filter.
		filter = function(filename)
			return (filename:match("%.cs$") or filename:match("%.fs$")) and not filename:match("/[ob][ij][bn]/")
		end,
		-- set custom diagnostic opts
		-- refer :h vim.diagnostic.Opts
		diagnostic_opts = {
			virtual_text = {
				prefix = "●",
			},
			severity_sort = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "",
				},
			},
		},
	},
	keys = {
		{ "<leader>cD", "<cmd>RequestDiagnostics<cr>", desc = "Request diagnostics", ft = { "cs", "fs" } },
	}
}
