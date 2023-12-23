return {
  "stevearc/conform.nvim",
  tag = "stable",
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      lua = { "stylua" },
      markdown = { "prettier" },
      python = { "ruff_fix", "ruff_format" },
      ["*"] = { "trim_whitespace" },
    },
  },
  init = function()
    vim.keymap.set("n", "gf", ":lua require('conform').format()<CR>")
  end,
}
