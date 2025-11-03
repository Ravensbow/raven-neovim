
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

--Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', function() require('modules.telescopePickers').prettyFilesPicker({ picker = 'find_files' }) end, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', function() require('modules.telescopePickers').prettyFilesPicker({ picker = 'git_files' }) end, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>/', function()
	require('modules.telescopePickers').prettyGrepPicker({ picker = 'grep_string', options = { search = vim.fn.input("Grep > ") } })
end, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>:', builtin.command_history, { desc = 'Telescope command history' })
vim.keymap.set('n', '<leader>fr', function() require('modules.telescopePickers').prettyFilesPicker({ picker = 'oldfiles' }) end, { desc = 'Telescope recent files' })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Telescope git status' })
vim.keymap.set('n', '<leader>gS', builtin.git_stash, { desc = 'Telescope git stash' })
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Telescope git commits' })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Telescope git branches' })
vim.keymap.set('n', '<leader>fall', builtin.builtin, { desc = 'Telescope all builtin pickers' })

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
vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
-- Run Codelens
opts.desc = "Run Codelens"
vim.keymap.set('n', '<leader>cc', vim.lsp.codelens.run, opts)
-- Refresh & Display Codelens
opts.desc = "Refresh & Display Codelens"
vim.keymap.set('n', '<leader>cC', vim.lsp.codelens.refresh, opts)
-- Rename File (Placeholder - LSP typically renames symbols)
opts.desc = "Rename File (Placeholder)"
vim.keymap.set('n', '<leader>cR', function() print("File rename not standard LSP. Use a plugin or custom function.") end, opts)
-- Rename Symbol
opts.desc = "Rename Symbol"
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, opts)
-- Source Action
opts.desc = "Source Action"
vim.keymap.set('n', '<leader>cA', vim.lsp.buf.code_action, opts) -- Often mapped to code_action with specific context
-- Next Diagnostic/Reference
opts.desc = "Next Diagnostic/Reference"
vim.keymap.set('n', ']]', function() vim.diagnostic.jump({count = 1}) end, opts)
opts.desc = "Next Diagnostic/Reference (Alt+n)"
vim.keymap.set('n', '<a-n>', vim.diagnostic.jump, opts)
-- Prev Diagnostic/Reference
opts.desc = "Prev Diagnostic/Reference"
vim.keymap.set('n', '[[' , function() vim.diagnostic.jump({count = -1}) end, opts)
opts.desc = "Prev Diagnostic/Reference (Alt+p)"
vim.keymap.set('n', '<a-p>', function() vim.diagnostic.jump({count = -1}) end, opts)
vim.keymap.set('i', '<C-Space>', '<C-x><C-o>')
vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'Goto definition', })
vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'Show all references' })
vim.keymap.set('n', 'gI', builtin.lsp_implementations, { desc = 'Goto implementation' })
vim.keymap.set('n', 'gy', builtin.lsp_type_definitions, { desc = 'Goto type definition' })
vim.keymap.set('n', '<leader>xx', builtin.diagnostics, { desc = 'Diagnostics' })

--Windows
-- Increase window height
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>')
-- Decrease window height
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>')
-- Increase window width
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')
-- Decrease window width
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
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
vim.keymap.set('n', '<leader>st', function ()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 15)
end, { desc = 'Open small terminal at the bottom' })
-- Clear search highlight
vim.keymap.set('n', '<C-/>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight'})
