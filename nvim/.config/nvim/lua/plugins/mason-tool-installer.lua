return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      -- LSP servers
      "css-lsp",
      "html-lsp",
      "lua-language-server",
      "pyright",
      "ruff-lsp",
      "typescript-language-server",
      -- Linters & formatters
      "prettier",
      "ruff",
      "stylua",
    },
    run_on_start = false,
  },
}
