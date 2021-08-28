"  ██          ██   ██               ██
" ░░          ░░   ░██              ░░
"  ██ ███████  ██ ██████    ██    ██ ██ ██████████
" ░██░░██░░░██░██░░░██░    ░██   ░██░██░░██░░██░░██
" ░██ ░██  ░██░██  ░██     ░░██ ░██ ░██ ░██ ░██ ░██
" ░██ ░██  ░██░██  ░██   ██ ░░████  ░██ ░██ ░██ ░██
" ░██ ███  ░██░██  ░░██ ░██  ░░██   ░██ ███ ░██ ░██
" ░░ ░░░   ░░ ░░    ░░  ░░    ░░    ░░ ░░░  ░░  ░░

" base

" Remove compatibility with VI
set nocompatible
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
map <S-k> <Nop>
map Q <NOP>
" Write with sudo
command Sudow w !sudo tee %
" Remap pane navigation to Ctrl+[h, j, k, l]
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Remap splits to SPC+[-,\]
nnoremap <leader>- <C-w>s
nnoremap <leader>\ <C-w>v

" macros

let @p='gg0Orequire ''pry''orequire ''pry-byebug''0'
let @i='oimport ipdb; ipdb.set_trace();'

" polyglot

" Disable vue because https://github.com/posva/vim-vue/issues/95#issuecomment-530436727
let g:polyglot_disabled = ['yaml', 'vue']

" plugs

if has('nvim')
  let plugged_dir = "$HOME/.config/nvim/plugged"
else
  let plugged_dir = "$HOME/.vim/plugged"
endif

call plug#begin(plugged_dir)
" Fuzzy searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
" Tree explorer
Plug 'scrooloose/nerdtree'
" Language packs
Plug 'sheerun/vim-polyglot'
" Logstash
Plug 'robbles/logstash.vim'
" Commenting lines
Plug 'tomtom/tcomment_vim'
" Better motion
Plug 'easymotion/vim-easymotion'
" Ends structures
Plug 'tpope/vim-endwise'
Plug 'rstacruz/vim-closer'
" Git integration
Plug 'tpope/vim-fugitive'
" Better search
Plug 'haya14busa/incsearch.vim'
" Find and replace in cwd
Plug 'dyng/ctrlsf.vim'
" Async linter
Plug 'neomake/neomake'
" Direct upload to GitHub Gist
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
" Run tests from inside nvim
Plug 'tpope/vim-dispatch'
Plug 'janko-m/vim-test'
" Interactive scratchpad
Plug 'metakirby5/codi.vim'
" Start screen
Plug 'mhinz/vim-startify'
" Better statusline
Plug 'b-ggs/vim-airline'
" Displays diff in gutter
Plug 'airblade/vim-gitgutter'
" 16-color colorscheme
Plug 'joshdick/onedark.vim'
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" coc

let g:coc_global_extensions = ['coc-pyright']

" fzf

if executable('fzf')
  " Prepend all fzf commands with 'Fzf'
  let g:fzf_command_prefix = 'Fzf'

  " Binds
  map <leader>f :FzfFiles<CR>
  map <leader>b :FzfBuffer<CR>
  map // :FzfLines<CR>
endif

" ctrlp

if !executable('fzf')
  " Binds
  map <leader>f :CtrlP<CR>
endif

" nerdtree

" Quit NERDTree when a file is opened
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let NERDTreeWinPos = "right"

" Binds
map <leader>t :NERDTreeToggle<CR>

" easymotion

" Keep cursor column in vertical motions
let g:EasyMotion_startofline = 0

" Binds
map <leader>l <Plug>(easymotion-lineforward)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)

" incsearch

" Turn off highlights after cursor move
let g:incsearch#auto_nohlsearch = 1

" Binds
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n <Plug>(incsearch-nohl-n)
map N <Plug>(incsearch-nohl-N)
map * <Plug>(incsearch-nohl-*)
map # <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" ctrlsf

" Set window size to 50%
let g:ctrlsf_winsize = '50%'

" Binds
nmap <leader>a <Plug>CtrlSFPrompt
nmap <leader>* <Plug>CtrlSFCCwordPath<CR>

" neomake

" Automake on normal mode changes, after 750ms
call neomake#configure#automake('nw', 750)

let g:neomake_python_enabled_makers = ['pep8']

" startify

" Custom header
let g:startify_custom_header = [
  \'   ┌─┐┌┐     ┌─┐┌─┐┌─┐',
  \'   │└┘├┴┐    │ ┬│ ┬└─┐',
  \'   └──└─┘────└─┘└─┘└─┘',
  \'',
  \ ]
" Do not change to directory of opened file
let g:startify_change_to_dir = 0
" Change directory to opened file's git repository's root
let g:startify_change_to_vcs_root = 1
" Display 5 files per section
let g:startify_files_number = 5
" Customize startify list order and content
let g:startify_list_order = [
  \ ['   MRU CWD'],
  \ 'dir',
  \ ['   MRU'],
  \ 'files',
  \ ]

" Binds
map <leader>S :Startify<CR>

" airline

let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
let g:airline_skip_empty_sections = 1
let g:airline_section_b = ''
let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
  let s:outer = ['', '', 0, 9]
  let s:inner = ['', '', 0, 12]
  let s:inactive = ['', '', 0, 8]

  let s:active_map = airline#themes#generate_color_map(s:outer, s:inner, s:inner)
  let s:inactive_map = airline#themes#generate_color_map(s:inactive, s:inactive, s:inactive)

  let a:palette.normal = s:active_map
  let a:palette.insert = s:active_map
  let a:palette.visual = s:active_map
  let a:palette.inactive = s:inactive_map

  let a:palette.normal_modified = s:active_map
  let a:palette.insert_modified = s:active_map
  let a:palette.visual_modified = s:active_map
  let a:palette.inactive_modified = s:inactive_map
endfunction

" onedark

" Set onedark to 16-color colorscheme
let g:onedark_termcolors=16
colorscheme onedark

" colors

" Set background to dark
set background=dark
" Color overrides
hi LineNr ctermfg=4
hi Visual ctermbg=3 ctermfg=0
hi Search ctermbg=3 ctermfg=0
hi VertSplit ctermbg=0 ctermfg=4
hi Comment ctermfg=8
hi! link StartifySpecial Normal
hi Normal ctermbg=NONE guibg=NONE
hi CocFloating ctermbg=0
hi Pmenu ctermbg=0
hi PmenuSel ctermfg=0

" temp inky stuff

autocmd BufNewFile,BufRead *.inky set filetype=html.erb

" testing coc stuff

autocmd FileType * let b:coc_additional_keywords = ["-"]
nmap <silent> gd <Plug>(coc-definition)
