if executable('fzf')
  " Prepend all fzf commands with 'Fzf'
  let g:fzf_command_prefix = 'Fzf'

  " Binds
  map <leader>f :FzfFiles<CR>
  map <leader>b :FzfBuffer<CR>
  map // :FzfLines<CR>
endif
