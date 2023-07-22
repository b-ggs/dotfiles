return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    view = { side = "right" },
    renderer = {
      icons = {
        show = {
          file = false,
          folder = false,
          folder_arrow = true,
        },
        git_placement = "after",
        glyphs = {
          folder = {
            arrow_closed = "▶",
            arrow_open = "▼",
            default = "▶",
            open = "▼",
            empty = "▶",
            empty_open = "▼",
            symlink = "▶",
            symlink_open = "▼",
          },
        },
      },
    },
    git = { ignore = false },
  },
  init = function()
    vim.keymap.set("n", "<Leader>t", ":NvimTreeToggle<CR>")
  end,
}
