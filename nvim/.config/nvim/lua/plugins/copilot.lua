return {
  "github/copilot.vim",
  init = function()
    vim.cmd([[
            imap <silent><script><expr> <C-j> copilot#Accept("\<CR>")
            let g:copilot_no_tab_map = v:true
        ]])
  end,
}
