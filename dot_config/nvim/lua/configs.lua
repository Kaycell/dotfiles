local opt = vim.opt

vim.cmd.colorscheme('catppuccin')

opt.cursorline    = true      -- Highlight the current line
opt.expandtab     = true      -- Use spaces instead of tabs
opt.guicursor     = {         -- Cursor shape & blink
  'n-v-c:block-blinkwait700-blinkoff400-blinkon250',
  'i-ci-ve:hor100-blinkwait700-blinkoff400-blinkon250',
}
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
