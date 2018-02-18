"  ██          ██   ██               ██
" ░░          ░░   ░██              ░░
"  ██ ███████  ██ ██████    ██    ██ ██ ██████████
" ░██░░██░░░██░██░░░██░    ░██   ░██░██░░██░░██░░██
" ░██ ░██  ░██░██  ░██     ░░██ ░██ ░██ ░██ ░██ ░██
" ░██ ░██  ░██░██  ░██   ██ ░░████  ░██ ░██ ░██ ░██
" ░██ ███  ░██░██  ░░██ ░██  ░░██   ░██ ███ ░██ ░██
" ░░ ░░░   ░░ ░░    ░░  ░░    ░░    ░░ ░░░  ░░  ░░

" #######
" PLUGINS
" #######

" Silently install vim-plug if it does not exist
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.config/nvim/plugged')
" Fuzzy searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Tree explorer
Plug 'scrooloose/nerdtree'
" Language packs
Plug 'sheerun/vim-polyglot'
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
call plug#end()

" ################
" GENERAL_SETTINGS
" ################

" Disable swap file
set noswapfile
" Set viminfo path
set viminfo='100,n$HOME/.config/nvim/nviminfo
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
" Display trailing whitespaces as •
set list listchars=trail:•
" Hide mode in statusline
set noshowmode
" Use terminal cursor for all modes
set guicursor=

"
" ##########
" KEY_REMAPS
" ##########

" Set leader key to Space
let mapleader = "\<Space>"
" Move via display line
map j gj
map k gk
" Remaps to correct mistypes
command W w
command Wq wq
command Sudow w !sudo tee %
map <F1> <Esc>
imap <F1> <Esc>
map <S-k> <Nop>
" Remap pane navigation to Ctrl+[h, j, k, l]
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
" Remap splits to SPC+[-,\]
nnoremap <leader>- <c-w>s
nnoremap <leader>\ <c-w>v
" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" ######
" MACROS
" ######

let @p='gg0Orequire ''pry''orequire ''pry-byebug''0'

" ######E
" FZF_VIM
" #######

" Prepend all fzf commands with 'Fzf'
let g:fzf_command_prefix = 'Fzf'
" Fzf keybindings
map <leader>f :FzfFiles<CR>
map <leader>b :FzfBuffer<CR>
map // :FzfLines<CR>

" ########
" NERDTREE
" ########

" Quit NERDTree when a file is opened
let NERDTreeQuitOnOpen = 1
" NERDTree keybindings
map <leader>t :NERDTreeToggle<CR>

" ##############
" VIM_EASYMOTION
" ##############

" Keep cursor column in vertical motions
let g:EasyMotion_startofline = 0
" Easymotion keybindings
map <leader>l <Plug>(easymotion-lineforward)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)

" #############
" INCSEARCH_VIM
" #############

" Turn off highlights after cursor move
let g:incsearch#auto_nohlsearch = 1
" Incsearch keybindings
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n <Plug>(incsearch-nohl-n)
map N <Plug>(incsearch-nohl-N)
map * <Plug>(incsearch-nohl-*)
map # <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" ##########
" CTRLSF_VIM
" ##########

" Keybindings
nmap <leader>a <Plug>CtrlSFPrompt
nmap <leader>* <Plug>CtrlSFCCwordPath<CR>
" Set window size to 50%
let g:ctrlsf_winsize = '50%'

" ############
" VIM_STARTIFY
" ############

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

" ###########
" VIM_AIRLINE
" ###########

" Set Airline theme to theme specified in zshrc
let g:airline_theme=$ZSH_THEME
" Customized Airline content
function! AirlineInit()
  let spc = g:airline_symbols.space
  let g:airline_section_a = airline#section#create_left(['mode'])
  let g:airline_section_b = ''
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

" ###########
" ONEDARK_VIM
" ###########

" Set onedark to 16-color colorscheme
let g:onedark_termcolors=16
colorscheme onedark

" ######
" COLORS
" ######

" Set background to dark
set background=dark
" Color overrides
highlight LineNr ctermfg=4
highlight Visual ctermbg=3 ctermfg=0
highlight Search ctermbg=3 ctermfg=0
highlight VertSplit ctermbg=0 ctermfg=4
highlight Comment ctermfg=8
highlight! link StartifySpecial Normal
