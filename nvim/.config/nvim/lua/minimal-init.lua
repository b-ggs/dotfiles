-- minimal-init.lua
-- Contains a minimal set of settings (i.e. without plugins) for Neovim
-- No swapfiles
vim.opt.swapfile = false

-- No errorbells
vim.opt.errorbells = false

-- Clipboard that works for macOS
-- TODO: Clipboard configuration for WSL?
vim.opt.clipboard = "unnamed,unnamedplus"

-- Wrap line to previous line's indentation
vim.opt.breakindent = true

-- Show linenumbers and set width to 3
vim.opt.number = true
vim.opt.numberwidth = 3

-- Case insensitive search for lowercase query
vim.opt.ignorecase = true

-- Case sensitive search for queries with caps
vim.opt.smartcase = true

-- Indent with 2 spaces when >> << == are used
vim.opt.shiftwidth = 2

-- Tab key will insert spaces instead of tabs
vim.opt.expandtab = true

-- Display trailing whitespaces as • and tab as →•
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", trail = "•" }

-- Use terminal cursor for all modes
vim.opt.guicursor = ""

-- Disable mouse
vim.opt.mouse = ""

-- Use relative line numbers
vim.opt.relativenumber = true

-- Set leader key to Space
vim.g.mapleader = " "

-- Set background to dark
vim.opt.background = "dark"

-- Set termguicolors
vim.opt.termguicolors = true

-- Move via display line but only if v:count is 0
-- i.e. `j` will execute `gj`, but `2j` will execute `2j`
-- https://stackoverflow.com/a/21000307
vim.keymap.set("n", "j", "v:count ? 'j' : 'gj'", { expr = true })
vim.keymap.set("n", "k", "v:count ? 'k' : 'gk'", { expr = true })

-- Remaps to correct mistypes
vim.keymap.set({ "n", "i", "v" }, "<F1>", "<Esc>")
vim.keymap.set({ "n", }, "<S-K>", "<Nop>")
vim.keymap.set({ "n", }, "Q", "<Nop>")

-- Commands to correct mistypes
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Wq", "wq", {})

-- Remap pane navigation to Ctrl+{h,j,k,l}
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Remap creating splits to leader+{-,\}
vim.keymap.set("n", "<Leader>-", ":split<CR>")
vim.keymap.set("n", "<Leader>\\", ":vsplit<CR>")

-- Disable python3 and ruby providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
