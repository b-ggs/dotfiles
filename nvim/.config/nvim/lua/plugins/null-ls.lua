return {
  "nvimtools/none-ls.nvim",
  opts = function()
    local null_ls = require("null-ls")

    return {
      sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.djhtml,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.ruff,
        null_ls.builtins.formatting.ruff_format,
        null_ls.builtins.formatting.stylua,
      },
    }
  end,
  init = function()
    vim.keymap.set("n", "gf", ":lua vim.lsp.buf.format()<CR>")
  end,
}
