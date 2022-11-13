local M = {}

function M.setup()
  local lspconfig = require("lspconfig")
  local languages = require("config.lsp.languages")

  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  local servers = {
    "sumneko_lua",
  }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
      capabilities = capabilities,
      settings = {
        Lua = languages.lua,
      },
    })
  end
end

return M
