return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      -- LSP servers
      "bash-language-server",
      "css-lsp",
      "html-lsp",
      "lua-language-server",
      "pyright",
      "tailwindcss-language-server",
      "typescript-language-server",
      "typos-lsp",
      "vue-language-server",
      -- Linters & formatters
      "prettier",
      "ruff", -- also an LSP server
      "shellcheck",
      "shfmt",
      "stylua",
      "taplo",
    },
    run_on_start = false,
  },
}
