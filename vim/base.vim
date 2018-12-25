" Set encoding to utf-8
set encoding=utf-8
scriptencoding utf-8
" Disable swap file
set noswapfile
" Disable bells
set noerrorbells
" Set statusline path relative to cwd
set statusline+=%f
" Set clipboard register to system clipboard
set clipboard=unnamed,unnamedplus
" Wrap line to previous line's indentation
set breakindent
" Show line numbers and set width to 3
set number numberwidth=3
" Case insensitive search for lowercase query
set ignorecase
" Case sensitive search for queries with caps
set smartcase
" Display tabs as 2 spaces
set tabstop=2
" Indent with 2 spaces when >> << == are used
set shiftwidth=2
" Tab key will insert spaces instead of tabs
set expandtab
" Display trailing whitespaces as • and tab as →•
set list listchars=trail:•,tab:→•
" Hide mode in statusline
set noshowmode
" Use terminal cursor for all modes
set guicursor=

" Set viminfo path
if has('nvim')
  set viminfo='100,n$HOME/.config/nvim/nviminfo
else
  set viminfo='100,n$HOME/.vim/viminfo
endif

" Set leader key to Space
let mapleader = "\<Space>"
" Move via display line
map j gj
map k gk
" Remaps to correct mistypes
command W w
command Wq wq
map <F1> <Esc>
imap <F1> <Esc>
map <S-k> <Nop>
map Q <NOP>
" Write with sudo
command Sudow w !sudo tee %
" Remap pane navigation to Ctrl+[h, j, k, l]
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
" Remap splits to SPC+[-,\]
nnoremap <leader>- <c-w>s
nnoremap <leader>\ <c-w>v
