return {
  "nvim-pack/nvim-spectre",
  opts = {
    color_devicons = false,
  },
  init = function()
    vim.keymap.set("n", "<leader>a", '<cmd>lua require("spectre").toggle()<CR>', {
      desc = "Toggle Spectre",
    })
  end,
}
