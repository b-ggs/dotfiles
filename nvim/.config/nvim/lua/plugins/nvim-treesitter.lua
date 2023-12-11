return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "p00f/nvim-ts-rainbow",
  },
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        "astro",
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
        "svelte",
        "typescript",
        "vim",
      },
      highlight = { enable = true },
      rainbow = { enable = false, extended_mode = true },
    })
  end,
}
