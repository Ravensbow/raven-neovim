vim.keymap.set("i", "jj", "<Esc>", { noremap = false })
--Przenoszenie lini w visual modzie
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--Kursor zostaje na miejscu po przerzucaniu dolnej lini do obecnej
vim.keymap.set("n", "J", "mzJ`z")
--Kursor jest wycentrowny przy half page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
--Kursor wycentrowany przy skakaniu w wyszukiwaniu
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
--pastowanie na cos bez zastepowania paste buffer tym co bylo zaznaczone
vim.keymap.set("v", "<C-p>", "\"_dP")
--kopiowanie rowniez do systemowego schowka
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Snacks Picker Keymaps
vim.keymap.set('n', '<leader>ff', function() Snacks.picker.files() end, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', function() Snacks.picker.git_files() end, { desc = 'Find Git Files' })

-- Search/Grep (Replacing your custom Grep > input)
vim.keymap.set('n', '<leader>/', function() Snacks.picker.grep() end, { desc = 'Grep Search' })

-- Standard Pickers
vim.keymap.set('n', '<leader>fb', function() Snacks.picker.buffers() end, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>:', function() Snacks.picker.command_history() end, { desc = 'Command History' })
vim.keymap.set('n', '<leader>fr', function() Snacks.picker.recent() end, { desc = 'Recent Files' })

-- Git Pickers
vim.keymap.set('n', '<leader>gs', function() Snacks.picker.git_status() end, { desc = 'Git Status' })
vim.keymap.set('n', '<leader>gS', function() Snacks.picker.git_stash() end, { desc = 'Git Stash' })
vim.keymap.set('n', '<leader>gc', function() Snacks.picker.git_log() end, { desc = 'Git Log (Commits)' })
vim.keymap.set('n', '<leader>gb', function() Snacks.picker.git_branches() end, { desc = 'Git Branches' })

-- All Pickers (Similar to builtin.builtin)
vim.keymap.set('n', '<leader>fall', function() Snacks.picker.pickers() end, { desc = 'All Snacks Pickers' })

-- Adding your requested LSP Symbols map
vim.keymap.set('n', '<leader>ss', function() Snacks.picker.lsp_symbols() end, { desc = 'LSP Symbols' })

-- LSP Navigation
vim.keymap.set('n', 'gd', function() Snacks.picker.lsp_definitions() end, { desc = 'Goto Definition' })
vim.keymap.set('n', 'gr', function() Snacks.picker.lsp_references() end, { desc = 'Show References', nowait = true })
vim.keymap.set('n', 'gI', function() Snacks.picker.lsp_implementations() end, { desc = 'Goto Implementation' })
vim.keymap.set('n', 'gy', function() Snacks.picker.lsp_type_definitions() end, { desc = 'Goto Type Definition' })

-- Symbols & Diagnostics
vim.keymap.set('n', '<leader>ss', function() Snacks.picker.lsp_symbols() end, { desc = 'LSP Document Symbols' })
vim.keymap.set('n', '<leader>xx', function() Snacks.picker.diagnostics({ layout = { preset = "vertical" } }) end,
	{ desc = 'Diagnostics' })

-- LSP

local opts = { noremap = true, silent = true }
-- Set buffer-local options for the attached buffer
-- opts.buffer = ev.buf
-- LSP Info
opts.desc = "Lsp Info"
vim.keymap.set('n', '<leader>cl', '<cmd>LspInfo<CR>', opts)
-- Goto Declaration
opts.desc = "Goto Declaration"
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
-- Hover (show documentation)
opts.desc = "Hover"
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
-- Signature Help (Normal mode)
opts.desc = "Signature Help"
vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, opts)
-- Signature Help (Insert mode)
opts.desc = "Signature Help"
vim.keymap.set('i', '<c-k>', vim.lsp.buf.signature_help, opts)
-- Code Action (Normal and Visual modes)
opts.desc = "Code Action"
-- vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set({ "n", "x" }, "<leader>ca", function()
	require("tiny-code-action").code_action()
end, { noremap = true, silent = true })
-- Run Codelens
opts.desc = "Run Codelens"
vim.keymap.set('n', '<leader>cc', vim.lsp.codelens.run, opts)
-- Refresh & Display Codelens
opts.desc = "Refresh & Display Codelens"
vim.keymap.set('n', '<leader>cC', vim.lsp.codelens.refresh, opts)
-- Rename File (Placeholder - LSP typically renames symbols)
opts.desc = "Rename File (Placeholder)"
vim.keymap.set('n', '<leader>cR', function() print("File rename not standard LSP. Use a plugin or custom function.") end,
	opts)
-- Rename Symbol
opts.desc = "Rename Symbol"
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, opts)
-- Source Action
opts.desc = "Source Action"
vim.keymap.set('n', '<leader>cA', vim.lsp.buf.code_action, opts) -- Often mapped to code_action with specific context
-- Next Diagnostic/Reference
opts.desc = "Next Diagnostic/Reference"
vim.keymap.set('n', ']]', function() vim.diagnostic.jump({ count = 1 }) end, opts)
opts.desc = "Next Diagnostic/Reference (Alt+n)"
vim.keymap.set('n', '<a-n>', vim.diagnostic.jump, opts)
-- Prev Diagnostic/Reference
opts.desc = "Prev Diagnostic/Reference"
vim.keymap.set('n', '[[', function() vim.diagnostic.jump({ count = -1 }) end, opts)
opts.desc = "Prev Diagnostic/Reference (Alt+p)"
vim.keymap.set('n', '<a-p>', function() vim.diagnostic.jump({ count = -1 }) end, opts)
vim.keymap.set('i', '<C-Space>', '<C-x><C-o>')
-- For rust
vim.api.nvim_create_autocmd("FileType", {
	pattern = "rust",
	callback = function()
		vim.keymap.set('n', ']]', function() vim.diagnostic.jump({ count = 1 }) end, { buffer = true })
		vim.keymap.set('n', '[[', function() vim.diagnostic.jump({ count = -1 }) end, { buffer = true })
	end,
})

--Windows
-- Increase window height
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>')
-- Decrease window height
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>')
-- Increase window width
vim.keymap.set('n', '<C-Right>', ':vertical resize -2<CR>')
-- Decrease window width
vim.keymap.set('n', '<C-Left>', ':vertical resize +2<CR>')
-- Move to window left
vim.keymap.set('n', '<C-h>', '<C-w>h')
-- Move to window down
vim.keymap.set('n', '<C-j>', '<C-w>j')
-- Move to window up
vim.keymap.set('n', '<C-k>', '<C-w>k')
-- Move to window right
vim.keymap.set('n', '<C-l>', '<C-w>l')
-- Split window below
vim.keymap.set('n', '<leader>-', ':split<CR>')
-- Split window right (vertically)
vim.keymap.set('n', '<leader>|', ':vsplit<CR>')
-- Delete (close) the current window
vim.keymap.set('n', '<leader>wd', ':close<CR>')
-- Terminal at the bottom
vim.keymap.set('n', '<leader>st', function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 15)
end, { desc = 'Open small terminal at the bottom' })
-- Clear search highlight
vim.keymap.set('n', '<C-/>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })
