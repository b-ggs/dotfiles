return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim" },
  opts = {
    ensure_installed = {
      "astro",
      "cssls",
      "emmet_ls",
      "html",
      "lua_ls",
      "pyright",
      "ruff_lsp",
      "rust_analyzer",
      "svelte",
      "tailwindcss",
      "tsserver",
      "vimls",
      "volar",
      "vuels",
    },
    automatic_installation = true,
  },
}
