return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
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
      rainbow = { enable = true, extended_mode = true },
      context_commentstring = { enable = true, enable_autocmd = false },
    })
  end,
}
