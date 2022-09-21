local M = {}

function M.setup()
  vim.g.catppuccin_flavour = "latte"

  require("catppuccin").setup()

  vim.cmd [[colorscheme catppuccin]]
end

return M
