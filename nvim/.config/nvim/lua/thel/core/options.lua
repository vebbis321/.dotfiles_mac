local opt = vim.opt -- conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs and indent
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.hlsearch = false
opt.incsearch = true

-- backing
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- appearance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.colorcolumn = "80"
opt.textwidth = 78
opt.cursorline = true
opt.background = "dark"

opt.scrolloff = 8
opt.isfname:append("@-@")
opt.updatetime = 50

opt.spelllang = 'en_us'
opt.spell = true
opt.showcmd = true

vim.g.mapleader = " "
