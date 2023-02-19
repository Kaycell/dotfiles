return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        gopls = {},
        pylsp = {},
      },
    },
  },
  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = {
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.black,
        nls.builtins.formatting.isort,
      }
    end,
  },
}
