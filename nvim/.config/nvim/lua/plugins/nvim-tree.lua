return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    opts = {
        view = {side = "right"},
        renderer = {icons = {git_placement = "after"}},
        git = {ignore = false}
    },
    init = function() vim.keymap.set("n", "<Leader>t", ":NvimTreeToggle<CR>") end
}
