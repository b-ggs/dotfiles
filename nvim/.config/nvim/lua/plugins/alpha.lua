return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  opts = function()
    local startify = require("alpha.themes.startify")
    startify.config.layout[2].val = "welcome to hell"
    startify.nvim_web_devicons.enabled = false
    return startify.config
  end,
}
