return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = {
    { "<Leader>f", ":Telescope find_files<CR>" },
    { "<Leader>g", ":Telescope live_grep<CR>" },
    { "<Leader>b", ":Telescope buffers<CR>" },
    { "<Leader>d", ":Telescope tags<CR>" },
    { "<Leader>/", ":Telescope current_buffer_fuzzy_find<CR>" },
    { "<Leader>k", ":Telescope keymaps<CR>" },
    { "<Leader>s", ":Telescope lsp_dynamic_workspace_symbols<CR>" },
  },
  lazy = true,
}
