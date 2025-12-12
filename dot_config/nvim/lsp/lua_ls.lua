local library = vim.tbl_filter(function(d)
  return not d:match(vim.fn.stdpath('config') .. '/?a?f?t?e?r?')
end, vim.api.nvim_get_runtime_file('', true))

---@type vim.lsp.Config
return {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = {
        '.luarc.json',
        '.luarc.jsonc',
        '.luacheckrc',
        '.stylua.toml',
        'stylua.toml',
        'selene.toml',
        'selene.yml',
        '.git',
    },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            completion = {
                enable = true,
            },
            diagnostics = {
                enable = true,
            },
            workspace = {
                library = library,
            },
        },
    },
}
