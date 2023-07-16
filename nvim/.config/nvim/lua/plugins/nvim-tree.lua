return {
	"kyazdani42/nvim-tree.lua",
	opts = {
		view = {
			side = "right",
		},
		renderer = {
			icons = {
				git_placement = "after",
			},
		},
		git = {
			ignore = false,
		},
	},
	init = function()
		vim.keymap.set("n", "<Leader>t", ":NvimTreeToggle<CR>")
	end,
}
