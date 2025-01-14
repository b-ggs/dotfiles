return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy", -- Or `LspAttach`
  priority = 1000, -- needs to be loaded in first
  config = function()
    vim.diagnostic.config({ virtual_text = false })
    require("tiny-inline-diagnostic").setup({
      preset = "simple",
      options = {
        show_source = true,
        multiple_diag_under_cursor = true,
        multilines = {
          enabled = true,
          always_show = true,
        },
        break_line = {
          enable = true,
        },
      },
    })
  end,
}
