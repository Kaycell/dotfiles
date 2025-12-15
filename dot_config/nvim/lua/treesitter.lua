local M = {}

M.supported_filetypes = {
    'go',
    'gomod',
    'lua',
    'python'
}

-- Convert filetypes to parser names
function M.parsers()
    local parsers, added = {}, {}
    for _, ft in ipairs(M.supported_filetypes) do
        local lang = vim.treesitter.language.get_lang(ft) or ft
        if not added[lang] then
            added[lang] = true
            table.insert(parsers, lang)
        end
    end
    return parsers
end

return M
