local opt = vim.opt

vim.cmd.colorscheme('catppuccin')

opt.colorcolumn   = '80'      -- Highlight column 80
opt.cursorline    = true      -- Highlight the current line
opt.expandtab     = true      -- Use spaces instead of tabs
opt.ignorecase    = true      -- Ignore case in search
opt.number        = true      -- Show line numbers
opt.shiftround    = true      -- Round indent to multiple of shiftwidth
opt.shiftwidth    = 4         -- Number of spaces for autoindent
opt.smartcase     = true      -- Match case on caps
opt.softtabstop   = 4         -- Number of spaces for a tab when editing
opt.swapfile      = false     -- Disable swap files
opt.tabstop       = 4         -- Number of spaces for a tab
opt.undofile      = true      -- Enable persistent undo
opt.winborder     = 'rounded' -- Use rounded borders for windows
opt.wrap          = false     -- Disable line wrapping
