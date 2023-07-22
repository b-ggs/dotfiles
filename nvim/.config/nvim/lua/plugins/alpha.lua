return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    config = require("alpha.themes.startify").config
    config.layout[2].val = "welcome to hell"
    return config
  end,
}
