return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = {"nvim-lua/plenary.nvim"},
    init = function()
        vim.keymap.set("n", "<Leader>f", ":Telescope find_files<CR>")
        vim.keymap.set("n", "<Leader>g", ":Telescope live_grep<CR>")
        vim.keymap.set("n", "<Leader>b", ":Telescope buffers<CR>")
        vim.keymap.set("n", "<Leader>d", ":Telescope tags<CR>")
        vim.keymap.set("n", "<Leader>/",
                       ":Telescope current_buffer_fuzzy_find<CR>")
        vim.keymap.set("n", "<Leader>k", ":Telescope keymaps<CR>")
        vim.keymap.set("n", "<Leader>s",
                       ":Telescope lsp_dynamic_workspace_symbols<CR>")
    end
}
