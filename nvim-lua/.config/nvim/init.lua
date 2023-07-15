-- No swapfiles
vim.opt.swapfile = false

-- No errorbells
vim.opt.errorbells = false

-- Clipboard that works for macOS
-- TODO: Clipboard configuration for WSL?
vim.opt.clipboard = "unnamed,unnamedplus"

-- Wrap line to previous line's indentation
vim.opt.breakindent = true

-- Show linenumbers and set width to 3
vim.opt.number = true
vim.opt.numberwidth = 3

-- Case insensitive search for lowercase query
vim.opt.ignorecase = true

-- Case sensitive search for queries with caps
vim.opt.smartcase = true

-- Display tabs as 2 spaces
vim.opt.tabstop = 4

-- Indent with 2 spaces when >> << == are used
vim.opt.shiftwidth = 2

-- Tab key will insert spaces instead of tabs
-- vim.opt.expandtab = true

-- Display trailing whitespaces as • and tab as →•
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", trail = "•" }

-- Use terminal cursor for all modes
vim.opt.guicursor = ""

-- Disable mouse
vim.opt.mouse = ""

-- Use relative line numbers
vim.opt.relativenumber = true

-- Set leader key to Space
vim.g.mapleader = " "

-- Set background to dark
vim.opt.background = "dark"

-- Set termguicolors
vim.opt.termguicolors = true

-- Move via display line but only if v:count is 0
-- i.e. `j` will execute `gj`, but `2j` will execute `2j`
-- https://stackoverflow.com/a/21000307
vim.keymap.set("n", "j", "v:count ? 'j' : 'gj'", { expr = true })
vim.keymap.set("n", "k", "v:count ? 'k' : 'gk'", { expr = true })

-- Remaps to correct mistypes
vim.keymap.set({ "n", "i", "v" }, "<F1>", "<Esc>")
vim.keymap.set({ "n", "i", "v" }, "<S-K>", "<Esc>")
vim.keymap.set({ "n", "i", "v" }, "Q", "<Nop>")

-- Commands to correct mistypes
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Wq", "wq", {})

-- Remap pane navigation to Ctrl+{h,j,k,l}
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Remap creating splits to leader+{-,\}
vim.keymap.set("n", "<Leader>-", ":split<CR>")
vim.keymap.set("n", "<Leader>\\", ":vsplit<CR>")

-- Set up lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Initialize lazy.nvim
require("lazy").setup({
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	"nvim-lualine/lualine.nvim",
}, {})

-- catppuccin

require("catppuccin").setup({
	integrations = {
		ts_rainbow = true,
	},
	color_overrides = {
		mocha = {
			text = "#F4CDE9",
			subtext1 = "#DEBAD4",
			subtext0 = "#C8A6BE",
			overlay2 = "#B293A8",
			overlay1 = "#9C7F92",
			overlay0 = "#866C7D",
			surface2 = "#705867",
			surface1 = "#5A4551",
			surface0 = "#44313B",
			base = "#352939",
			mantle = "#211924",
			crust = "#1a1016",
		},
	},
})

vim.cmd.colorscheme("catppuccin")

-- lualine

local palette = require("catppuccin.palettes.init").get_palette()

require("lualine").setup({
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
})
