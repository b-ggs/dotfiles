return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
	},
	opts = function()
		local palette = require("catppuccin.palettes.init").get_palette()

		return {
			options = {
				theme = "catppuccin",
				section_separators = "",
				component_separators = "",
			},
			sections = {
				lualine_a = {
					{
						"filename",
						path = 1,
						separator = { left = "", right = "" },
						color = { bg = palette.pink, fg = palette.base, gui = "bold" },
						padding = 0,
						shorting_target = 10,
					},
				},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {
					{
						"filetype",
						color = { bg = palette.mantle, fg = palette.text },
						padding = 0,
					},
					{
						"%l/%L,%c",
						color = { bg = palette.mantle, fg = palette.text },
						padding = 1,
					},
				},
			},
			inactive_sections = {
				lualine_a = {
					{
						"filename",
						path = 1,
						color = { fg = palette.surface1 },
						padding = 1,
						shorting_target = 10,
					},
				},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {
					{
						"filetype",
						color = { bg = palette.mantle, fg = palette.surface1 },
						padding = 0,
					},
					{
						"%l/%L,%c",
						color = { bg = palette.mantle, fg = palette.surface1 },
						padding = 1,
					},
				},
			},
		}
	end,
}
