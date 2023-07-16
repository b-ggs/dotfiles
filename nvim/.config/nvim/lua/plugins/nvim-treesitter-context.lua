return {
    "nvim-treesitter/nvim-treesitter-context",
    config = true,
    init = function()
        vim.api.nvim_set_hl(0, "TreesitterContextBottom", {underline = true})
    end
}
