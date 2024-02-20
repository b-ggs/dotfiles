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
      "tailwindcss-language-server",
      "typescript-language-server",
      "typos-lsp",
      -- Linters & formatters
      "prettier",
      "ruff",
      "stylua",
      "typos",
    },
    run_on_start = false,
  },
}
