local M = {}

function M.setup()
  local opt = vim.opt

  -- Providers
  vim.g.python_host_prog     = "/Users/kevin.viricel/.pyenv/shims/python2"
  vim.g.python3_host_prog    = "/Users/kevin.viricel/.pyenv/shims/python3"
  vim.g.loaded_node_provider = 0
  vim.g.loaded_perl_provider = 0
  vim.g.loaded_ruby_provider = 0

  opt.termguicolors  = true          -- Enable colors in terminal
  opt.hlsearch       = true          -- Set highlight on search
  opt.number         = true          -- Make line numbers default
  opt.relativenumber = true          -- Make relative number default
  opt.mouse          = "a"           -- Enable mouse mode
  opt.breakindent    = true          -- Enable break indent
  opt.undofile       = true          -- Save undo history
  opt.ignorecase     = true          -- Case insensitive searching unless /C or capital in search
  opt.smartcase      = true          -- Smart case
  opt.updatetime     = 250           -- Decrease update time
  opt.signcolumn     = "yes"         -- Always show sign column
  opt.expandtab      = true          -- 
  opt.tabstop        = 2             -- Tabs behavior
  opt.softtabstop    = 2             --
  opt.shiftwidth     = 2             --
  opt.laststatus     = 3             -- Global status line

  -- Highlight on yank
  vim.cmd [[
    augroup YankHighlight
      autocmd!
      autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup end
  ]]
end

return M
