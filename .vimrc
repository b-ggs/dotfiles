" Vundle
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Vundle packages
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'rking/ag.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/gist-vim'
Plugin 'itchyny/lightline.vim'
Plugin 'yegappan/mru'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'briancollins/vim-jst'
Plugin 'tpope/vim-pathogen'
Plugin 'Shougo/vimproc.vim'
Plugin 'mattn/webapi-vim'
Plugin 'godlygeek/tabular'
Plugin 'eparreno/vim-l9'
Plugin 'rstacruz/vim-closer'
Plugin 'mhinz/vim-startify'

" General settings
syntax enable
filetype plugin indent on
set nocompatible
set ruler
set noswapfile
set autoindent 
set backspace=indent,eol,start "src http://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode

" Map F1 to Esc
map <F1> <Esc>
imap <F1> <Esc>

" Remap leader
let mapleader = "\<Space>"

" Easymotion 
map <leader>l <Plug>(easymotion-lineforward)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)

" Disable annoying bells.
set noerrorbells

" Path relative to working directory
set statusline+=%f

" show statusline even when no window split
set laststatus=2

" autoread files
set autoread

" indentation
set breakindent

" system clipboard
set clipboard=unnamedplus,unnamed

" move via display line
map j gj
map k gk

" ctrlp
map <leader>f :CtrlP<CR>

" ag.vim
nnoremap <leader>a :Ag! 

" BufExplorer
map <leader>b :BufExplorer<CR>

" line numbers
set number
set numberwidth=3

" highlighting search
set hlsearch
set incsearch

" tab == 2 spaces
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

" case insensitive search
set ignorecase

" search becomes case sensitive if caps used
set smartcase

" Remap pane navigadtion
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <leader>- <c-w>s
nnoremap <leader>\ <c-w>v

" Remap mark
nnoremap ; `

" Buffer number next to filename
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" NERDTree
map <leader>t :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

" Lightline
let g:lightline = {
  \ 'colorscheme': 'jellybeans',
  \ 'component_function': {
  \   'filename': 'LightLineFilename'
  \ }
\ }
  " \ 'separator': { 'left': '', 'right': '' },
  " \ 'subseparator': { 'left': '', 'right': '' }

" Show path on Lightline
function! LightLineFilename()
  return expand('%')
endfunction     
  
set noshowmode

" Startify
let g:startify_custom_header = [
      \'   ┌─┐┌┐     ┌─┐┌─┐┌─┐ ',
      \'   │└┘├┴┐    │ ┬│ ┬└─┐ ',
      \'   └──└─┘────└─┘└─┘└─┘ ',
  		\'',
  		\ ]
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1

" Ctrlp
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'"
let g:ctrlp_reuse_window  = 'startify'

" Ag path
let g:ag_working_path_mode="r"

" Color override
set background=light
highlight LineNr ctermfg=1
highlight Visual cterm=NONE ctermbg=3 ctermfg=Black guibg=Gray
highlight Search cterm=NONE ctermbg=3 ctermfg=Black guibg=Gray
highlight VertSplit ctermbg=236 ctermfg=236

" Persistent clipboard
autocmd VimLeave * call system("xsel -ib", getreg('+'))
