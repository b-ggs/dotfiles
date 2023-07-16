return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring", "p00f/nvim-ts-rainbow"
    },
    opts = {
        ensure_installed = {
            "astro", "dockerfile", "hcl", "help", "html", "javascript", "json",
            "lua", "markdown", "python", "query", "rust", "svelte",
            "typescript", "vim"
        },
        -- highlight = {
        -- 	enable = true,
        -- 	additional_vim_regex_highlighting = false,
        -- },
        rainbow = {enable = true, extended_mode = true},
        context_commentstring = {enable = true, enable_autocmd = false}
    }
}
