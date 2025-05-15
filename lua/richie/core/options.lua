vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- spacing options
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true
opt.autoindent = true
opt.wrap = false
-- opt.backspace = "indent,eol,start" -- Need to play witht his before implementing fully

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- theme settings
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- copy paste settings
opt.clipboard:append("unnamedplus")
