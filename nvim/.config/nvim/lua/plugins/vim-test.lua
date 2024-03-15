return {
  "vim-test/vim-test",
  cmd = { "TestNearest", "TestFile" },
  keys = {
    { "tn", ":TestNearest<CR>" },
    { "tf", ":TestFile<CR>" },
  },
  init = function()
    vim.cmd([[
      let test#strategy = "neovim"
      let test#neovim#term_position = "vert"
      " Override this value in local.nvimrc
      let test#python#djangotest#executable="docker exec web python manage.py test"
    ]])
  end,
  lazy = true,
}
