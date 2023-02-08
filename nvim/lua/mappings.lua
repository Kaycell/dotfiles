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

  -- Paste/Yank from clipboard
  map({ "n", "v" }, "<leader><leader>p", "\"+p", default_options)
  map({ "n", "v" }, "<leader><leader>y", "\"+y", default_options)
  map({ "n", "v" }, "<leader><leader>yy", "\"+yy", default_options)

  -- Left explorer toggle
  map("n", "<leader>e", ":30Lexplore<CR>", default_options)
end

return M
