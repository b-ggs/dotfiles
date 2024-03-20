return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-vim-test",
  },
  opts = function()
    return { adapters = { require("neotest-vim-test") } }
  end,
  init = function()
    vim.keymap.set("n", "tt", ":lua require('neotest').run.run()<CR>")
    vim.keymap.set("n", "ts", ":lua require('neotest').summary.toggle()<CR>")
    vim.keymap.set("n", "to", ":lua require('neotest').output.open()<CR>")
  end,
}
