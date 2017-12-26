" Vundle
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Vundle packages
Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'vim-scripts/ag.vim'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/vim-closer'
Plugin 'mhinz/vim-startify'
Plugin 'tpope/vim-rails'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-endwise'
Plugin 'haya14busa/incsearch.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'b-ggs/vim-airline'
Plugin 'dylanaraps/wal.vim'
Plugin 'metakirby5/codi.vim'
Plugin 'brooth/far.vim'
Plugin 'airblade/vim-gitgutter'

" General settings
syntax enable
filetype plugin indent on
set nocompatible
set ruler
set noswapfile
set autoindent
set encoding=utf-8
set backspace=indent,eol,start " src http://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode
set re=1 " src https://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlighting
set viminfo='100,n$HOME/.vim/files/info/viminfo

" Aliases
command W w
command Wq wq
command Sudow w !sudo tee %

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
set clipboard=unnamed,unnamedplus

" move via display line
map j gj
map k gk

" fzf.vim
let g:fzf_command_prefix = 'Fzf'
map <leader>f :FzfFiles<CR>
map <leader>b :FzfBuffer<CR>
map // :FzfLines<CR>

" ag.vim
nnoremap <leader><leader>a :Ag! 

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

" Startify
let g:startify_custom_header = [
  \'   ┌─┐┌┐     ┌─┐┌─┐┌─┐',
  \'   │└┘├┴┐    │ ┬│ ┬└─┐',
  \'   └──└─┘────└─┘└─┘└─┘',
  \'',
  \ ]
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_files_number = 5
let g:startify_list_order = [
  \ ['   MRU CWD'],
  \ 'dir',
  \ ['   MRU'],
  \ 'files',
  \ ]

" incsearch.vim
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" ctrlsf.vim
let g:ctrlsf_winsize = '50%'
nmap <leader>a <Plug>CtrlSFPrompt
nmap <leader>* <Plug>CtrlSFCCwordPath<CR>

" airline
let g:airline_theme=$VIM_THEME
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

" Color override
set background=dark
colorscheme wal
highlight LineNr ctermfg=4
highlight Visual cterm=NONE ctermbg=3 ctermfg=16
highlight Search cterm=NONE ctermbg=3 ctermfg=16
highlight def link ctrlsfMatch Search
highlight VertSplit ctermbg=4 ctermfg=0

" Macros
let @p='gg0Orequire ''pry''orequire ''pry-byebug''0'
