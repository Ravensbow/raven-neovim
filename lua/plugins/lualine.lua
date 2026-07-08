return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		-- 1. Pobieramy bazowy motyw auto
		local custom_theme = require('lualine.themes.auto')

		-- 2. Lista trybów, które chcemy zmodyfikować
		local tryby = { 'normal', 'insert', 'visual', 'replace', 'command', 'inactive' }
		local moj_kolor_tla = '#233228' -- Twój docelowy ciemny kolor

		for _, tryb in ipairs(tryby) do
			if custom_theme[tryb] then
				-- Jeśli sekcja 'c' nie istnieje w danym trybie, tworzymy ją jako pustą tabelę
				if not custom_theme[tryb].c then
					custom_theme[tryb].c = {}
				end
				-- Przypisujemy kolor tła
				custom_theme[tryb].c.bg = moj_kolor_tla
			end
		end
		require('lualine').setup {
			options = {
				icons_enabled = true,
				theme = custom_theme,
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = false,
				refresh = {
					statusline = 100,
					tabline = 100,
					winbar = 100,
				}
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = {
					{
						'filename',
						path = 1,
						color = { bg = '#233228' }
					}
				},
				lualine_x = { 'encoding', 'fileformat', 'filetype', },
				lualine_y = { 'progress' },
				lualine_z = { 'location' }
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { 'filename' },
				lualine_x = { 'location' },
				lualine_y = {},
				lualine_z = {}
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {}
		}
	end,
}
