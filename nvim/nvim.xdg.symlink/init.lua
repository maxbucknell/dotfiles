--------------------------
-- Vim Functionality Stuff
--------------------------

-- Disable creation of swap files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Set updatetime for showing hints.
-- It's funny, updatetime is used for swap file creation and CursorHold autoevent
-- But we don't use swap files (yet? Maybe we will?
vim.opt.updatetime = 300

-- Keep buffers around when they are not visible
vim.opt.hidden = true

-- Keep buffers up to date with external changes
vim.opt.autoread = true

-- Show incomplete command outputs in buffer
vim.opt.showcmd = true

-- Improve searching behaviour
vim.opt.ignorecase = true
vim.opt.smartcase = true

-----------
-- UI Stuff
-----------

vim.opt.colorcolumn = "+1"

-- Status Line
vim.opt.laststatus = 2 -- Always show status line
vim.opt.statusline = "-[%.30t]-%y-" -- filename and filetype


-- Invisible characters
vim.opt.list = true
vim.opt.listchars = "tab:‣ ,trail:·,extends:◣,precedes:◢,nbsp:○"
vim.opt.fillchars = "stl:—,stlnc:·,eob: "

-- Hide :intro
vim.opt.shortmess:append("I")

-- Disable code folding
vim.opt.foldmethod = "manual"
vim.opt.foldenable = false

vim.opt.cursorline = true
vim.opt.textwidth = 80
vim.opt.wrap = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 5

vim.opt.splitbelow = true
vim.opt.splitright = true

------------------
-- Code Formatting
------------------

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.autoindent = true

----------------------
-- Syntax Highlighting
----------------------

vim.cmd("syntax off")
vim.cmd([[
    syntax off
    hi LineNr ctermfg=4
    hi CursorLineNr ctermfg=7 ctermbg=0
    hi Search ctermfg=7 ctermbg=8

    filetype plugin indent on
]])
