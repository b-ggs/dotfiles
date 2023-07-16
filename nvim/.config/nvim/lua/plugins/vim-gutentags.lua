return {
  'ludovicchabant/vim-gutentags',
  init=function()
    vim.g.gutentags_file_list_command = 'rg --files | rg -v ".json"'
  end
}
