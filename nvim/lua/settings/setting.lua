local set = vim.opt

-------enable-------
set.number = true
set.relativenumber = true

set.nu = true
set.title = true
set.wildmenu = true

set.cursorline = true
set.termguicolors = true

set.undofile = true

set.hidden = true
set.autoindent = true
set.splitbelow = true
set.splitright = true
set.breakindent = true
-------disable--------
set.wrap = false

set.swapfile = false

set.showmode = false
set.backup = false
set.writebackup = false
-------with the value--------
set.backspace = "indent,eol,start"

set.scrolloff = 8
set.sidescrolloff = 14

set.encoding = "utf-8"
set.fileencoding = "utf-8"

set.conceallevel = 2

set.laststatus = 3
set.updatetime = 100
set.signcolumn = "yes"
set.numberwidth = 2
set.mouse = "a"
set.completeopt = "menuone,noselect"
set.fillchars = "eob: "

--tab
set.expandtab = true
set.smarttab = true
set.shiftwidth = 4
set.softtabstop = 4
set.tabstop = 2

--search
set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true
