return {
  "vim-test/vim-test",
  init = function()
    vim.keymap.set("n", "tn", ":TestNearest<CR>")
    vim.keymap.set("n", "tf", ":TestFile<CR>")

    vim.cmd([[
      let test#strategy = "neovim"
      let test#neovim#term_position = "vert"
      " Override this value in local.nvimrc
      let test#python#djangotest#executable="docker exec web python manage.py test"
    ]])
  end,
}
