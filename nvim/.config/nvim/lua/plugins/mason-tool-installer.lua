return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      -- LSP servers
      "bash-language-server",
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
      "shellcheck",
      "shfmt",
      "stylua",
      "typos",
    },
    run_on_start = false,
  },
}
