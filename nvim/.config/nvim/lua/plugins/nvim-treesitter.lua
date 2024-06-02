return {
  "nvim-treesitter/nvim-treesitter",
  -- Last known good tag before this issue:
  -- https://github.com/nvim-treesitter/nvim-treesitter/issues/6530
  tag = "v0.9.2",
  build = ":TSUpdate",
  dependencies = {
    "p00f/nvim-ts-rainbow",
  },
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        "astro",
        "css",
        "dockerfile",
        "hcl",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "python",
        "query",
        "rust",
        "scss",
        "svelte",
        "typescript",
        "vim",
        "vue",
      },
      highlight = { enable = true },
      rainbow = { enable = false, extended_mode = true },
    })
  end,
}
