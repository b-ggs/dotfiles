return {
  "stevearc/conform.nvim",
  tag = "stable",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "gf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    -- https://github.com/stevearc/conform.nvim#formatters
    -- :help conform-formatters

    formatters_by_ft = {
      css = { "prettier" },
      javascript = { "prettier" },
      json = { "prettier" },
      html = { "prettier" },
      lua = { "stylua" },
      markdown = { "prettier" },
      python = { "ruff_fix", "ruff_format" },
      sh = { "shfmt", "shellcheck" },
      toml = { "taplo" },
      yaml = { "prettier" },
      ["*"] = { "trim_whitespace" },
    },
  },
}
