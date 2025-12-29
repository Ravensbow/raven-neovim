vim.g.mapleader = " "
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.wrap = false
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"
vim.diagnostic.config({ virtual_text = { current_line = true } })
vim.o.background = "dark" -- or "light" for light mode
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.api.nvim_set_hl(0, "@lsp.type.extensionMethod.cs", { link = "@function" })
vim.api.nvim_set_hl(0, "@lsp.type.recordClass.cs", { link = "@type" })

vim.api.nvim_create_autocmd('TermOpen', {
	desc = 'Settings of nvim build in terminal',
	group = vim.api.nvim_create_augroup('custom-term-open', { clear = true, }),
	callback = function ()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

--Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
