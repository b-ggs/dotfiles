return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "p00f/nvim-ts-rainbow",
  },
  config = function()
    -- local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
    --
    -- -- Last known good revision before this issue:
    -- -- https://github.com/nvim-treesitter/nvim-treesitter/issues/6530
    -- parser_configs["dockerfile"] = {
    --   install_info = {
    --     url = "https://github.com/camdencheek/tree-sitter-dockerfile",
    --     revision = "33e22c33bcdbfc33d42806ee84cfd0b1248cc392",
    --     files = { "src/parser.c" },
    --   },
    -- }

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
