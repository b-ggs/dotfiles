return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = {
    fold_open = "▼",
    fold_closed = "▶",
    icons = false,
    signs = {
      error = "E",
      warning = "W",
      hint = "H",
      information = "I",
      other = "O",
    },
  },
  lazy = true,
}
