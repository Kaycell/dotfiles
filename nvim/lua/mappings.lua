local M = {}

function M.setup()
  local map = vim.keymap.set
  local default_options = { silent = true }

  -- Remap leader and local leader to <Space>
  map({ "n", "v" }, "<Space>", "<Nop>", default_options)
  vim.g.mapleader      = " "
  vim.g.maplocalleader = " "

  -- Cancel search highlighting with ESC
  map("n", "<esc>", ":nohlsearch<Bar>:echo<CR>", default_options)

  -- Switch buffer
  map("n", "]b", ":bnext<CR>", default_options)
  map("n", "[b", ":bprev<CR>", default_options)
end

return M
