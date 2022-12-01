local M = {}

function M.setup()
  vim.g.catppuccin_flavour = "mocha"

  require("catppuccin").setup()

  vim.cmd [[colorscheme catppuccin]]
end

return M
