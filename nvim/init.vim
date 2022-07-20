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
" Use terminal cursor for all modes
set guicursor=
" Disable mouse
set mouse=

" Set viminfo path
set viminfo='100,n$HOME/.config/nvim/nviminfo

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

" Tab navigation via leader+number
" https://vim.fandom.com/wiki/Alternative_tab_navigation
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt

" Tab navigation with t prefix
" https://vim.fandom.com/wiki/Alternative_tab_navigation
nnoremap th :tabprev<CR>
nnoremap tj :tabprev<CR>
nnoremap tk :tabnext<CR>
nnoremap tl :tabnext<CR>
nnoremap tt :tabedit<Space>
nnoremap tn :tabnew<CR>
nnoremap tm :tabm<Space>
nnoremap td :tabclose<CR>

" macros

let @p='gg0Orequire ''pry''orequire ''pry-byebug''0'
let @i='oimport ipdb; ipdb.set_trace();'

" polyglot

" Disable vue because https://github.com/posva/vim-vue/issues/95#issuecomment-530436727
let g:polyglot_disabled = ['vue']

" plugs

let plugged_dir = "$HOME/.config/nvim/plugged"
call plug#begin(plugged_dir)
" Fuzzy searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Tree explorer
Plug 'scrooloose/nerdtree'
" Tree-sitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
" Commenting lines
Plug 'tomtom/tcomment_vim'
" Better motion
Plug 'phaazon/hop.nvim'
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
" Displays diff in gutter
Plug 'airblade/vim-gitgutter'
" colorscheme
Plug 'b-ggs/catppuccin-nvim', {'as': 'catppuccin'}
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" tags
Plug 'ludovicchabant/vim-gutentags'
" copilot
Plug 'github/copilot.vim'
" synstack
Plug 'dylnmc/synstack.vim'
" Hex codes to colors
Plug 'norcalli/nvim-colorizer.lua'
" Lua-powered statusline
Plug 'nvim-lualine/lualine.nvim'
" Per-directory local config
Plug 'klen/nvim-config-local'
" neotest and neotest dependencies
Plug 'nvim-lua/plenary.nvim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-neotest/neotest'
call plug#end()

" coc

let g:coc_global_extensions = [
  \ "coc-pyright",
  \ "coc-svelte",
  \ "coc-json",
  \ "coc-rls",
  \ "coc-tsserver",
  \ "coc-prettier",
  \ "coc-css",
  \ "coc-html",
  \ ]

autocmd FileType * let b:coc_additional_keywords = ["-"]

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> ga <Plug>(coc-codeaction-selected)
nmap <silent> gs <Plug>(coc-codeaction)
nmap <silent> gf <Plug>(coc-format)
nmap <silent> gr <Plug>(coc-rename)
nmap <silent> go <Plug>(coc-refactor)
nmap <silent> ge <Plug>(coc-references)

inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Bit of a hack to consistently get coc-pyright to format python files
" For some reason, black is a bit of a hit-or-miss when saving files,
" even when coc.preferences.willSaveHandlerTimeout is set to the highest
" possible value
" https://github.com/fannheyward/coc-pyright/issues/229#issuecomment-754231643
aug python
  au!
  au BufWrite *.py call CocAction('format')
aug END

" fzf

if executable('fzf')
  " Prepend all fzf commands with 'Fzf'
  let g:fzf_command_prefix = 'Fzf'

  map <leader>f :FzfFiles<CR>
  map <leader>b :FzfBuffer<CR>
  map <leader>d :FzfTags<CR>
  map <leader>/ :FzfLines<CR>
endif

" nerdtree

let NERDTreeShowHidden = 1
let NERDTreeWinPos = "right"

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

nmap <leader>a <Plug>CtrlSFPrompt
nmap <leader>* <Plug>CtrlSFCCwordPath<CR>

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

map <leader>S :Startify<CR>

" colors: catppuccin

set background=dark
set termguicolors

lua << EOF
local catppuccin = require("catppuccin")
-- local palette = require("catppuccin.core.palettes.init").get_palette()

catppuccin.setup({
  integrations = {
    coc_nvim = true,
    gitgutter = true,
  },
  -- custom_highlights = {
  --   String = { fg = palette.pink },
  --   TSString = { fg = palette.pink },
  -- },
})
EOF

let g:catppuccin_flavour = "pinkdrink" " latte, frappe, macchiato, mocha, pinkdrink
colorscheme catppuccin

" copilot

imap <silent><script><expr> <C-j> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" synstack
:nmap <leader>ss <plug>(SynStack)

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

" colorizer

lua <<EOF
require'colorizer'.setup()
EOF

" lualine

lua <<EOF
local palette = require("catppuccin.palettes.init").get_palette()

require('lualine').setup({
  options = {
    theme = "catppuccin",
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_a = {
      {
        "filename",
        path = 1,
        separator = { left = '', right = '' },
        color = { bg = palette.pink, fg = palette.base, gui = "bold" },
        padding = 0,
        shorting_target = 0,
      },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        "%l/%L,%c",
        color = { bg = palette.mantle, fg = palette.text },
        padding = 1,
      },
      {
        "filetype",
        color = { bg = palette.mantle, fg = palette.text },
        padding = 0,
      },
    },
  },
  inactive_sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
        color = { fg = palette.surface1 },
        padding = 1,
        shorting_target = 0,
      },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        "%l/%L,%c",
        color = { bg = palette.mantle, fg = palette.surface1 },
        padding = 1,
      },
      {
        "filetype",
        color = { bg = palette.mantle, fg = palette.surface1 },
        padding = 0,
      },
    },
  },
})
EOF

" nvim-config-local

lua <<EOF
require('config-local').setup {
  config_files = { "local.nvimrc" }
}
EOF
