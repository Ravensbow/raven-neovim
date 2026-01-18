return {
	'nvim-treesitter/nvim-treesitter',
	branch = 'main',
	lazy = false,
	build = ':TSUpdate',
	config = function()
		require 'nvim-treesitter'.setup {
			-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
			install_dir = vim.fn.stdpath('data') .. '/site'
		}

		vim.api.nvim_create_autocmd('FileType',
			{
				pattern = { 'go', 'cs' },
				callback = function()
					vim.treesitter.start()
					-- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			})
	end
}
