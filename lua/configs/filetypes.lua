-- Treesitter start
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'go', 'cs', 'jq', 'razor', 'cshtml', 'html', 'wgsl' },
	callback = function()
		vim.treesitter.start()
		-- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end
})

-- Formaters
vim.api.nvim_create_autocmd("FileType", {
	pattern = "json",
	callback = function()
		vim.bo.formatprg = "jq"
	end,
})
