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

" statusline http://vimdoc.sourceforge.net/htmldoc/options.html#'statusline'
set laststatus=2
" start with blank
set statusline=
" relative filename
set statusline+=%f
" modified flag
set statusline+=%m
" read-only flag
set statusline+=%r
" coc status
" set statusline+=\ %{coc#status()}
" switch to right-align
set statusline+=%=
" line number/number of lines, column number
set statusline+=%l/%L,%c
" space character
set statusline+=\ 
" file type
set statusline+=%Y

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
let g:polyglot_disabled = ['vue']

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
" Tree-sitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
" Commenting lines
Plug 'tomtom/tcomment_vim'
" Better motion
Plug 'phaazon/hop.nvim'
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
" Plug 'b-ggs/vim-airline'
" Displays diff in gutter
Plug 'airblade/vim-gitgutter'
" 16-color colorscheme
Plug 'jeffkreeftmeijer/vim-dim'
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" tags
Plug 'ludovicchabant/vim-gutentags'
" copilot
Plug 'github/copilot.vim'
" synstack
Plug 'dylnmc/synstack.vim'
call plug#end()

" coc

let g:coc_global_extensions = ["coc-pyright", "coc-svelte", "coc-json", "coc-rls", "coc-tsserver", "coc-prettier", "coc-css", "coc-html"]

autocmd FileType * let b:coc_additional_keywords = ["-"]

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> ga <Plug>(coc-codeaction-selected)
nmap <silent> gs <Plug>(coc-codeaction)
nmap <silent> gf <Plug>(coc-fix-current)
nmap <silent> gr <Plug>(coc-rename)

inoremap <silent><expr> <c-space> coc#refresh()


" fzf

if executable('fzf')
  " Prepend all fzf commands with 'Fzf'
  let g:fzf_command_prefix = 'Fzf'

  " Binds
  map <leader>f :FzfFiles<CR>
  map <leader>b :FzfBuffer<CR>
  map <leader>d :FzfTags<CR>
  map <leader>/ :FzfLines<CR>

  " Floating window borders
  function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
  endfunction

  let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
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

" hop.nvim

lua require'hop'.setup()
" Use <cmd> instead of : here
" https://github.com/phaazon/hop.nvim/issues/126
map <leader>j <cmd>HopLine<CR>
map <leader>k <cmd>HopLine<CR>
map <leader>l <cmd>HopChar1<CR>

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
let g:startify_custom_header = ['   welcome to hell']
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

" let g:airline_left_sep = ' '
" let g:airline_right_sep = ' '
" let g:airline_skip_empty_sections = 1
" let g:airline_section_b = ''
" let g:airline_theme_patch_func = 'AirlineThemePatch'
" function! AirlineThemePatch(palette)
"   let s:outer = ['', '', 0, 9]
"   let s:inner = ['', '', 0, 12]
"   let s:inactive = ['', '', 0, 8]
"
"   let s:active_map = airline#themes#generate_color_map(s:outer, s:inner, s:inner)
"   let s:inactive_map = airline#themes#generate_color_map(s:inactive, s:inactive, s:inactive)
"
"   let a:palette.normal = s:active_map
"   let a:palette.insert = s:active_map
"   let a:palette.visual = s:active_map
"   let a:palette.inactive = s:inactive_map
"
"   let a:palette.normal_modified = s:active_map
"   let a:palette.insert_modified = s:active_map
"   let a:palette.visual_modified = s:active_map
"   let a:palette.inactive_modified = s:inactive_map
" endfunction

" vim-dim
colorscheme dim

" copilot

imap <silent><script><expr> <C-j> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" synstack
:nmap <leader>ss <plug>(SynStack)

" colors

" Set background to dark
set background=dark

" Color overrides

" Vertical split line
hi VertSplit ctermbg=NONE ctermfg=8
" Gutter and gutter symbols
hi SignColumn ctermbg=NONE
" Status line
hi StatusLine ctermbg=NONE ctermfg=1
" Inactive status line
hi StatusLineNC ctermbg=NONE ctermfg=8
" Unselected floating menu items (e.g. in coc)
hi Pmenu ctermbg=NONE ctermfg=15
" Selected floating menu item (e.g. in coc)
hi PmenuSel ctermbg=NONE ctermfg=1
hi Conceal ctermbg=8 ctermfg=0
hi NormalFloat ctermbg=NONE ctermfg=15
hi MatchParen ctermfg=0
hi CocHighlightText ctermfg=1 ctermbg=0

hi ErrorMsg ctermfg=0
hi Statement ctermfg=1
hi Type ctermfg=4
hi Identifier ctermfg=1
hi PreProc ctermfg=4
hi Constant ctermfg=6
hi Search ctermbg=1 ctermfg=0

hi pythonClassVar ctermfg=3
hi pythonConditional ctermfg=4
hi pythonOperator ctermfg=10

" temp inky stuff

autocmd BufNewFile,BufRead *.inky set filetype=html.erb

" tree-sitter

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "query",
    "python",
    "html",
    "javascript",
    "dockerfile",
    "markdown",
    "rust",
    "svelte",
    "typescript",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF

nmap <leader>st :TSHighlightCapturesUnderCursor<CR>
nmap <leader>sp :TSPlaygroundToggle<CR>
