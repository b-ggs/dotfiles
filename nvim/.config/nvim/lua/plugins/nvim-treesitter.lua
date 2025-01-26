return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "p00f/nvim-ts-rainbow",
  },
  config = function()
    local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

    -- Use fork that addresses this issue:
    -- https://github.com/nvim-treesitter/nvim-treesitter/issues/6530
    -- PR: https://github.com/camdencheek/tree-sitter-dockerfile/pull/52
    parser_configs["dockerfile"] = {
      install_info = {
        url = "https://github.com/faergeek/tree-sitter-dockerfile",
        branch = "make-language-injections-easier",
        files = { "src/parser.c", "src/scanner.c" },
      },
    }

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
        "just",
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
