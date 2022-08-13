"  ██          ██   ██               ██
" ░░          ░░   ░██              ░░
"  ██ ███████  ██ ██████    ██    ██ ██ ██████████
" ░██░░██░░░██░██░░░██░    ░██   ░██░██░░██░░██░░██
" ░██ ░██  ░██░██  ░██     ░░██ ░██ ░██ ░██ ░██ ░██
" ░██ ░██  ░██░██  ░██   ██ ░░████  ░██ ░██ ░██ ░██
" ░██ ███  ░██░██  ░░██ ░██  ░░██   ░██ ███ ░██ ░██
" ░░ ░░░   ░░ ░░    ░░  ░░    ░░    ░░ ░░░  ░░  ░░

" ---
" general config
" ---

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
" Relative line numbers
set relativenumber

" Set viminfo path
set viminfo='100,n$HOME/.config/nvim/nviminfo

" ---
" keybinds
" ---

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

" ---
" macros
" ---

let @p='gg0Orequire ''pry''orequire ''pry-byebug''0'
let @i='oimport ipdb; ipdb.set_trace();'

" ---
" vim-plug
" ---

let plugged_dir = "$HOME/.config/nvim/plugged"
call plug#begin(plugged_dir)
" Tree-sitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
" Git integration
Plug 'tpope/vim-fugitive'
" Find and replace in cwd
Plug 'dyng/ctrlsf.vim'
" Start screen
Plug 'mhinz/vim-startify'
" colorscheme
Plug 'b-ggs/catppuccin-nvim', {'as': 'catppuccin'}
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
" Run tests in a neovim terminal
Plug 'vim-test/vim-test'
" Async tests
Plug 'nvim-lua/plenary.nvim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-neotest/neotest'
Plug 'nvim-neotest/neotest-vim-test'
" Native lsp
Plug 'neovim/nvim-lspconfig'
" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Formatting
Plug 'mhartington/formatter.nvim'
" Fuzzy finder
Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.0'}
" File exploer
Plug 'kyazdani42/nvim-tree.lua'
" Git decorations
Plug 'lewis6991/gitsigns.nvim'
" Commenting
Plug 'numToStr/Comment.nvim'
" Parentheses matching
Plug 'p00f/nvim-ts-rainbow'
" LSP installer
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
call plug#end()

" ---
" ctrlsf
" ---

" Set window size to 50%
let g:ctrlsf_winsize = '50%'

nmap <leader>a <Plug>CtrlSFPrompt
nmap <leader>* <Plug>CtrlSFCCwordPath<CR>

" ---
" startify
" ---

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

" ---
" catppuccin
" ---

set background=dark
set termguicolors

lua << EOF
local catppuccin = require("catppuccin")

catppuccin.setup({
  integrations = {
    ts_rainbow = true,
  },
})
EOF

let g:catppuccin_flavour = "pinkdrink_v3"
colorscheme catppuccin

" ---
" copilot
" ---

" Use Ctrl-j to accept suggestions
imap <silent><script><expr> <C-j> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" ---
" synstack
" ---

nmap <leader>ss <plug>(SynStack)

" ---
" treesitter
" ---

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
    "lua",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
  }
}
EOF

nmap <leader>st :TSHighlightCapturesUnderCursor<CR>
nmap <leader>sp :TSPlaygroundToggle<CR>

" ---
" colorizer
" ---

lua <<EOF
require'colorizer'.setup()
EOF

" ---
" lualine
" ---

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

" ---
" nvim-config-local
" ---

lua <<EOF
require('config-local').setup {
  config_files = { "local.nvimrc" }
}
EOF

" ---
" vim-test
" ---

nmap <silent> tn :TestNearest<CR>
nmap <silent> tf :TestFile<CR>

let test#strategy = "neovim"
let test#neovim#term_position = "vert"
" Override this value in local.nvimrc
let test#python#djangotest#executable="docker exec web python manage.py test"

" ---
" neotest
" ---

lua <<EOF
require("neotest").setup({
  adapters = {
    require("neotest-vim-test"),
  },
})
EOF

nmap <silent> tt <cmd>lua require("neotest").run.run()<CR>
nmap <silent> ts <cmd>lua require("neotest").summary.toggle()<CR>
nmap <silent> to <cmd>lua require("neotest").output.open()<CR>

" ---
" nvim-cmp
" ---

set completeopt=menu,menuone,noselect

lua <<EOF
-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
EOF

" ---
" nvim-lspconfig
" ---

lua <<EOF
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', 'ge', vim.diagnostic.open_float, opts)
vim.keymap.set('n', 'gp', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', 'gn', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', 'gq', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gH', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', 'gwa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', 'gwr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', 'gwl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', 'gtd', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', 'grn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', 'gca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gF', vim.lsp.buf.formatting, bufopts)
end

-- Globally add borders to all nvim-lspconfig floating windows
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#borders
border="single"
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

require('lspconfig')['pyright'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

require('lspconfig')['svelte'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

require('lspconfig')['html'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  filetypes = {"html", "htmldjango"},
}

require('lspconfig')['cssls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

require('lspconfig')['tsserver'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

require('lspconfig')['vimls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}
EOF

" ---
" formatter.nvim
" ---

lua <<EOF
require('formatter').setup({
  filetype = {
    python = {
      require("formatter.filetypes.python").black,
      require("formatter.filetypes.python").isort,
    },
    htmldjango = {
      function()
        return {
          exe = "djhtml",
          args = { "-" },
          stdin = true,
        }
      end,
    },
    svelte = {
      require("formatter.filetypes.svelte").prettier,
    },
    javascript = {
      require("formatter.filetypes.javascript").prettier,
    },
    css = {
      require("formatter.filetypes.css").prettier,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    }
  },
})
EOF

nnoremap <silent> gf :Format<CR>

" ---
" telescope
" ---

nnoremap <leader>f <cmd>Telescope find_files<CR>
nnoremap <leader>g <cmd>Telescope live_grep<CR>
nnoremap <leader>b <cmd>Telescope buffers<CR>
nnoremap <leader>d <cmd>Telescope tags<CR>
nnoremap <leader>/ <cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap <leader>k <cmd>Telescope keymaps<CR>
nnoremap <leader>s <cmd>Telescope lsp_dynamic_workspace_symbols<CR>

" ---
" nvim-tree
" ---

lua <<EOF
require("nvim-tree").setup({
  view = {
    side = "right",
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "H",
      info = "I",
      warning = "W",
      error = "E",
    },
  },
  renderer = {
    icons = {
      show = {
        file = false,
        folder = false,
      },
      git_placement = "after",
    },
  },
})
EOF

map <leader>t :NvimTreeToggle<CR>

" ---
" gitsigns
" ---

lua <<EOF
require('gitsigns').setup()
EOF

" ---
" comment.nvim
" ---

lua <<EOF
require('Comment').setup()
EOF

" ---
" vim-gutentags
" ---

" Use rg to feed files to vim-gutentags
" https://github.com/universal-ctags/ctags/issues/218#issuecomment-377731658
let g:gutentags_file_list_command = 'rg --files | rg -v ".json"'

" ---
" mason.nvim
" ---

lua <<EOF
require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "cssls",
    "html",
    "pyright",
    "sumneko_lua",
    "svelte",
    "tsserver",
    "vimls",
  },
  automatic_installation = true,
})
EOF
