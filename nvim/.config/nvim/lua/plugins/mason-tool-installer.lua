return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
        ensure_installed = {
            "astro-language-server", "black", "css-lsp", "emmet-ls", "html-lsp",
            "lua-language-server", "prettier", "pyright", "ruff", "stylua",
            "svelte-language-server", "terraform-ls", "tflint",
            "typescript-language-server", "vim-language-server"
        },
        run_on_start = false
    }
}
