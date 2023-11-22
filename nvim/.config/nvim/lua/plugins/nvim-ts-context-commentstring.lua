return {
  "JoosepAlviste/nvim-ts-context-commentstring",
  config = true,
  init = function()
    vim.g.skip_ts_context_commentstring_module = true
  end,
}
