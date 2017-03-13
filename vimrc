" Vundle
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Vundle packages
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'mattn/gist-vim'
Plugin 'yegappan/mru'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-pathogen'
Plugin 'Shougo/vimproc.vim'
Plugin 'mattn/webapi-vim'
Plugin 'godlygeek/tabular'
Plugin 'eparreno/vim-l9'
Plugin 'rstacruz/vim-closer'
Plugin 'mhinz/vim-startify'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-obsession'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-endwise'
Plugin 'b-ggs/vim-airline'

" General settings
syntax enable
filetype plugin indent on
set nocompatible
set ruler
set noswapfile
set autoindent
set encoding=utf-8
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
let g:EasyMotion_startofline = 0

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
set clipboard=unnamed

" move via display line
map j gj
map k gk

" fzf
map <leader>f :FZF<CR>
map <leader>a :Ag<CR>
map <leader>b :Buffer<CR>

" ag.vim
" nnoremap <leader>a :Ag! 

" BufExplorer
" map <leader>b :BufExplorer<CR>

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

" Disable S-k
map <S-k> <Nop>

let g:airline_theme='outrun'

function! AirlineInit()
  let spc = g:airline_symbols.space
  let g:airline_section_a = airline#section#create_left(['mode'])
  let g:airline_section_b = ''
  " let g:airline_section_b = airline#section#create_left(['branch'])
  if exists("+autochdir") && &autochdir == 1
    let g:airline_section_c = airline#section#create_left(['path'])
  else
    let g:airline_section_c = airline#section#create_left(['file'])
  endif
  let g:airline_section_x = ''
  let g:airline_section_y = airline#section#create_left(['filetype'])
  let g:airline_section_z = airline#section#create_left(['%3p%%'.spc, 'linenr',  ':%3v'])
  let g:airline_section_error = ''
  let g:airline_section_warning = ''
  let g:airline_left_sep = ' '
  let g:airline_right_sep = ' '
endfunction
autocmd User AirlineAfterInit call AirlineInit()
autocmd VimEnter * call AirlineInit()

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
set viminfo='100,n$HOME/.vim/files/info/viminfo

" Color override
set background=light
highlight LineNr ctermfg=1
highlight Visual cterm=NONE ctermbg=3 ctermfg=0
highlight Search cterm=NONE ctermbg=3 ctermfg=0
highlight VertSplit ctermbg=4 ctermfg=16

" Persistent clipboard
autocmd VimLeave * call system("xsel -ib", getreg('+'))
