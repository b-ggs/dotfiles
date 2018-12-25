if has('nvim')
  let plugged_dir = "$HOME/.config/nvim/plugged"
else
  let plugged_dir = "$HOME/.vim/plugged"
endif

call plug#begin(plugged_dir)
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
call plug#end()
