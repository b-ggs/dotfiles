return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    -- Use fork that addresses this issue:
    -- https://github.com/nvim-treesitter/nvim-treesitter/issues/6530
    -- PR: https://github.com/camdencheek/tree-sitter-dockerfile/pull/52
    vim.api.nvim_create_autocmd("User", {
      pattern = "TSUpdate",
      callback = function()
        require("nvim-treesitter.parsers").dockerfile = {
          install_info = {
            url = "https://github.com/faergeek/tree-sitter-dockerfile",
            branch = "make-language-injections-easier",
            files = { "src/parser.c", "src/scanner.c" },
          },
        }
      end,
    })

    require("nvim-treesitter").install({
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
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "astro", "css", "dockerfile", "hcl", "html", "javascript", "json",
        "just", "lua", "markdown", "python", "query", "rust", "scss",
        "svelte", "typescript", "vim", "vue",
      },
      callback = function() vim.treesitter.start() end,
    })
  end,
}
